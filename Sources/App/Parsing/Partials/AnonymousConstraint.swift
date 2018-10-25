import Foundation

struct AnonymousConstraint {
    
    let first: LayoutItemAttribute
    let second: LayoutItemAttribute?
    let relation: Constraint.Relation
    let constant: Constant
    let multiplier: Multiplier
}

extension AnonymousConstraint {
    
    init(first: (partialInstance: PartialInstance, attribute: Attribute), relation: Constraint.Relation, multiplier: Multiplier, second: (partialInstance: PartialInstance, attribute: Attribute)?, constant: Constant, names: [String:Instance]) throws {
        
        let instance1 = try first.partialInstance.getInstance(names: names)
        
        self.init(
            first: LayoutItemAttribute(layoutItem: instance1,
                                       attribute: first.attribute),
            second: try second.map { LayoutItemAttribute(layoutItem: try $0.partialInstance.getInstance(names: names),
                                                         attribute: $0.attribute) },
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }
    
    
    init(axis: Attribute.Axis, partialInstance2: PartialInstance, comparison: (relation: Constraint.Relation, amount: Double), partialInstance1: PartialInstance, names: [String:Instance]) throws {
        
        let instance1 = try partialInstance1.getInstance(names: names)
        let instance2 = try partialInstance2.getInstance(names: names)
        
        let pinpoints: (Attribute.PinPoint, Attribute.PinPoint) = {
            switch (partialInstance1, partialInstance2) {
            case (.superview, _):
                return (.end, .end)
            case (_, .superview):
                return (.start, .start)
            default:
                return (.start, .end)
            }
        }()
        
        let attribute1 = try Attribute(axis: axis, pinPoint: pinpoints.0)
        let attribute2 = try Attribute(axis: axis, pinPoint: pinpoints.1)
        
        self.init(first: LayoutItemAttribute(layoutItem: instance1,
                                             attribute: attribute1),
                  second: LayoutItemAttribute(layoutItem: instance2,
                                              attribute: attribute2),
                  relation: comparison.relation,
                  constant: Constant(comparison.amount),
                  multiplier: Multiplier())
    }
    
    init(axis: Attribute.Axis, partialInstance: PartialInstance, comparison: (relation: Constraint.Relation, amount: Double), names: [String:Instance]) throws {
        
        let instance = try partialInstance.getInstance(names: names)
        let attribute = try Attribute(axis: axis, pinPoint: .extent)
        let first = LayoutItemAttribute(layoutItem: instance, attribute: attribute)
        
        self.init(
            first: first,
            second: nil,
            relation: comparison.relation,
            constant: Constant(comparison.amount),
            multiplier: Multiplier()
        )
    }
}

extension AnonymousConstraint {
    
    func deanonymized(instance: Instance, isFromAutoresizingMask: Bool) -> Constraint {
        
        let origin: Constraint.Origin
        if isFromAutoresizingMask {
            origin = .autoresizingMask
        } else if let identifier = instance.identifier, identifier.hasPrefix("UIView-Encapsulated-Layout") {
            origin = .encapsulatedLayout
        } else if let identifier = instance.identifier, identifier.hasPrefix("UISV") {
            origin = .stackView
        } else {
            origin = .user
        }
        
        return Constraint(
            identity: instance,
            first: first,
            second: second,
            relation: relation,
            constant: constant,
            multiplier: multiplier,
            origin: origin
        )
    }
}

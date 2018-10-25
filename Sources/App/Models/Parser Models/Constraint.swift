import Foundation

struct Constraint {
    
    enum Origin {
        case user
        case encapsulatedLayout
        case autoresizingMask
        case stackView
    }
    
    enum Relation: String {
        
        case equal = "=="
        case lessThanOrEqual = "<="
        case greaterThanOrEqual = ">="
        
        static let allCases: [Relation] = [
            .equal,
            .lessThanOrEqual,
            .greaterThanOrEqual
        ]
    }
    
    let identity: Instance
    let first: LayoutItemAttribute
    let second: LayoutItemAttribute?
    let relation: Relation
    let constant: Constant
    let multiplier: Multiplier
    let origin: Origin
}

extension Constraint {
    
    var layoutItemAttributes: [LayoutItemAttribute] {
        return [
            first,
            second
            ].compactMap { $0 }
    }
    
    var layoutItems: [Instance] {
        return layoutItemAttributes.map { $0.layoutItem }
    }
}

extension Constraint {
    
    var footnote: Footnote? {
        switch origin {
        case .autoresizingMask:
            return .autoresizingMask
        case .encapsulatedLayout:
            return .encapsulatedLayout
        case .stackView:
            return .stackView
        case .user:
            return nil
        }
    }
}

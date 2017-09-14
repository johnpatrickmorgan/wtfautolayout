import Foundation

extension Constraint {
    
    func htmlDescription(annotations: [Instance: Annotation]) -> String {
        
        let one = first.htmlDescription(annotation: annotations[first.layoutItem])
        let two = second?.htmlDescription(annotation: second.flatMap { annotations[$0.layoutItem] })
        let hideMultiplicand = multiplier.value == 1.0
        let multiplicand = hideMultiplicand ? nil : multiplier.htmlDescription()
        let hideSummand = constant.value == 0.0 && second != nil
        let summand = hideSummand ? nil : constant.htmlDescription(includePositivePrefix: second != nil)
        
        return [
            one,
            relation.htmlDescription(),
            two,
            multiplicand,
            summand
            ].flatMap { $0 }.joined(separator: " ") + "."
    }
}

extension LayoutItemAttribute {
    
    func htmlDescription(annotation: Annotation? = nil) -> String {
        
        let underlineColor = annotation?.color ?? .defaultColor
        return "<code style=\"box-shadow: 0px -1px 0px \(underlineColor.hex) inset; padding-bottom: 1px;\">\(layoutItem.prettyName)\(annotation?.uniquingSuffix ?? "")</code>'s \(attribute.htmlDescription())"
    }
}

extension Attribute {
    
    func htmlDescription() -> String {
        
        switch self {
        case .leading:              return "leading edge"
        case .trailing:             return "trailing edge"
        case .top:                  return "top edge"
        case .bottom:               return "bottom edge"
        case .centerX:              return "horizontal center"
        case .centerY:              return "vertical center"
        case .width:                return "width"
        case .height:               return "height"
        case .leadingMargin:        return "leading margin"
        case .trailingMargin:       return "trailing margin"
        case .topMargin:            return "top margin"
        case .bottomMargin:         return "bottom margin"
        case .centerXWithinMargins: return "horizontal center (within its margins)"
        case .centerYWithinMargins: return "vertical center (within its margins)"
        case .firstBaseline:        return "first line of text's baseline"
        case .lastBaseline:         return "last line of text's baseline"
        }
    }
}

extension Constraint.Relation {
    
    func htmlDescription() -> String {
        switch self {
        case .equal:
            return "should equal"
        case .lessThanOrEqual:
            return "should be at most"
        case .greaterThanOrEqual:
            return "should be at least"
        }
    }
}

extension Multiplier {
    
    func htmlDescription() -> String {
        
        return "multiplied by \(format(number: value, maximumFractionDigits: 3))"
    }
}

extension Constant {
    
    func htmlDescription(includePositivePrefix: Bool = false) -> String {
        
        let positivePrefix = includePositivePrefix ? "plus" : nil
        let prefix: String? = value == 0.0 ? nil : value > 0.0 ? positivePrefix : "minus"
        let number = format(number: abs(value))
        
        return [prefix, number].flatMap { $0 }.joined(separator: " ")
    }
}

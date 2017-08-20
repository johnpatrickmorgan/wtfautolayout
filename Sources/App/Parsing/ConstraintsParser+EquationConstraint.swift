import Foundation
import Sparse

// MARK: - Equation Constraint
// (e.g. "UIImageView:0x7fd382f50.top == UITableViewCell:0x7fd39b20.top")

extension ConstraintsParser {
    
    static let equationConstraint = layoutItemAttribute.thenSkip(wss).then(relation)
        .thenSkip(wss).then(multiplier).then(optional(layoutItemAttribute))
        .thenSkip(wss).then(constant).then(optionalInfo)
        .map { try AnonymousConstraint(first: $0.0.0.0.0,
                                       relation: $0.0.0.0.1,
                                       multiplier: $0.0.0.1,
                                       second: $0.0.1,
                                       constant: $0.1,
                                       names: $1) }
}

private extension ConstraintsParser {
    
    static let layoutItemAttribute = partialInstance.then(dotAttribute)
    static let constant = number.map(Constant.init).otherwise(pure(Constant()))
    static let multiplier = number.thenSkip(string("*"))
        .map(Multiplier.init).otherwise(pure(Multiplier()))
}

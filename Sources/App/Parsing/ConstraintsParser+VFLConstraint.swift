import Foundation
import Sparse

// MARK: - VFL Constraint
// (e.g. "V:[UIView:0x1f5a31b0]-(385)-|   (Names: '|':UIView:0x1f5a3120 )")

extension ConstraintsParser {
    
    static let vflSpaceConstraint = vflAxis.then(vflBoundedEntity).thenSkip(dash).then(vflExtent).thenSkip(dash).then(vflBoundedEntity).thenSkip(vflDirection).then(optionalInfo)
        .map(flatten).map(AnonymousConstraint.init)
    
    static let vflExtentConstraint = vflAxis.thenSkip(character("[")).then(vflEntity).then(vflExtent).thenSkip(character("]")).thenSkip(vflDirection).then(optionalInfo)
        .map(flatten).map(AnonymousConstraint.init)
    
    static let vflConstraint = vflExtentConstraint.otherwise(vflSpaceConstraint)
    static let vflExtent = character("(").skipThen(extent).thenSkip(character(")"))
}

// MARK: - Private

private extension ConstraintsParser {
    
    static let hAxis = character("H").map { _ in Attribute.Axis.horizontal }
    static let vAxis = character("V").map { _ in Attribute.Axis.vertical }
    static let superview = character("|")
    static let vflAxis = hAxis.otherwise(vAxis).thenSkip(colon)
    static let vflIdentifierCharacter = characterNot(in: "[]|()")
    static let vflIdentifier = many(identifierCharacter.and(vflIdentifierCharacter)).asString()
    static let vflEntity = instance.map({ PartialInstance.instance($0) }).otherwise(vflIdentifier.map({ PartialInstance.identifier($0) }))
    static let vflBoundedEntity = character("[").skipThen(vflEntity).thenSkip(character("]")).otherwise(string("|").map({ _ in PartialInstance.superview }))
    static let vflDirection = optional(string("(LTR)").otherwise(string("(RTL)")))
}

import Foundation
import Sparse

// MARK: - Auto Layout Primitives

extension ConstraintsParser {
    
    static let identifierCharacter = characterNot(in: .newlines)
        .named("valid identifier character")
    
    static let relation = Constraint.Relation.allCases
        .map(parserForRelation)
        .reduce(pureError(), { $1.otherwise($0) })
        .named("relation")
    
    static let attribute: Parser<Attribute> = Attribute.allCases
        .map(parserForAttribute)
        .reduce(pureError(), { $1.otherwise($0) })
        .named("attribute")
    
    static let dotAttribute = dot.skipThen(attribute)
        .named("dot attribute")
    
    static let number = numberString.map(parseDouble)
        .named("number")
}

private extension ConstraintsParser {
    
    static let sign = optional(string("+")).skipThen(optional(string("-")))
    static let signedInteger = sign.thenSkip(wss).then(integer).map { "\($0 ?? "")\($1)" }
    static let exponent = character("e").then(signedInteger).map { "\($0)\($1)" }
        .named("exponent")
    static let postDecimal = character(".").then(integer).map { "\($0)\($1)" }
    static let decimal = signedInteger.then(optional(postDecimal)).map { "\($0)\($1 ?? "")" }
    static let numberString = decimal.then(optional(exponent)).map { "\($0)\($1 ?? "")" }
    
    static func parserForAttribute(_ attribute: Attribute) -> Parser<Attribute> {
        let attributeParser = attribute.labels.reduce(pureError(), { string($1).otherwise($0) })
        return attributeParser.map { _ in return attribute }
    }
    
    static func parserForRelation(_ relation: Constraint.Relation) -> Parser<Constraint.Relation> {
        return string(relation.rawValue).map { _ in return relation }
    }
    
    static func parseDouble(_ input: String) throws -> Double {
        guard let result = Double(input) else {
            throw InvalidConstraintError("'\(input)' is not a valid number")
        }
        
        return result
    }
}

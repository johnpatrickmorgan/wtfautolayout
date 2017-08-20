import Foundation
import Sparse

// MARK:- Complete constraints log parser.

enum ConstraintsParser {
    
    static func parse(log: String) throws -> [Constraint] {
        
        let stream = Stream(log)
        return try constraintsLog._run(stream)
    }
}

// MARK: - Private

private extension ConstraintsParser {
    
    static let constraintsLog = wsnls.thenSkip(optional(character("("))).skipThen(wsnls).skipThen(constraints)
        .thenSkip(wsnls).thenSkip(optional(character(")"))).thenSkip(wsnls).thenSkip(end())
    
    static let constraint = constraintInstance.thenSkip(wss).then(equationConstraint.otherwise(vflConstraint)).map { $1.deanonymized(instance: $0.0, isFromAutoresizingMask: $0.1) }
    static let boundedConstraint = string("\"<").skipThen(constraint).thenSkip(string(">\""))
    static let constraintSeparator = character(",").skipThen(wsnls).named("constraint separator")
    static let constraints = many(boundedConstraint, separator: constraintSeparator)
}


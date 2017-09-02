import Foundation
import Sparse

// MARK:- Complete constraints log parser.

enum ConstraintsParser {
    
    static func parse(log: String) throws -> ConstraintGroup {
        
        let input = log.trimmingLogAffixes()
        let stream = Stream(input)
        let constraints = try constraintsLog._run(stream)
        
        return ConstraintGroup(constraints, raw: input)
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

// MARK: - Trimming Log Affixes

fileprivate extension String {
    
    func trimmingLogAffixes() -> String {
        
        return self.trimmingLogSuffix().trimmingLogPrefix()
    }
    
    func trimmingLogPrefix() -> String {
        
        let prefixEnd1 = "(Note: If you're seeing NSAutoresizingMaskLayoutConstraints that you don't understand, refer to the documentation for the UIView property translatesAutoresizingMaskIntoConstraints)"
        let prefixEnd2 = "(2) find the code that added the unwanted constraint or constraints and fix it."
        
        guard let range = range(of: prefixEnd1) ?? range(of: prefixEnd2) else {
            return self
        }
        
        return substring(from: range.upperBound)
    }
    
    func trimmingLogSuffix() -> String {
        
        let suffixStart = "Will attempt to recover by breaking constraint"
        
        guard let range = range(of: suffixStart) else {
            return self
        }
        
        return substring(to: range.lowerBound)
    }
}

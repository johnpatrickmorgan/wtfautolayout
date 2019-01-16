import Foundation
import Vapor
import Sparse

class OutputController {
    
    let input: String
    let includePermalink: Bool
    
    init(input: String, includePermalink: Bool = true) {
        self.input = input
        self.includePermalink = includePermalink
    }

    func view(req: Request) throws -> Future<View> {
        
        let trimmedInput = input
            .trimmingLogAffixes()
            .removingBlankLines()
            .trimmingCharacters(in: .whitespaces)
        
        do {
            let group = try ConstraintsParser.parse(input: trimmedInput)
            let node = group.leafNode(includePermalink: includePermalink)
            
            return try req.view().render("output", node)
            
        } catch let error as ParserError {
            
            let context = [
                "prefill": trimmedInput,
                "error": error.description
            ]
            
            let logger = try req.make(Logger.self)
            logger.error(["PARSING ERROR:", trimmedInput, error.description].joined(separator: "\n"))
            
            return try req.view().render("input", context)
        }
    }
}

private extension String {
    
    func trimmingLogAffixes() -> String {
        
        return self.trimmingLogSuffix().trimmingLogPrefix()
    }
    
    func trimmingLogPrefix() -> String {
        
        let prefixEnd1 = "refer to the documentation for the UIView property translatesAutoresizingMaskIntoConstraints)"
        let prefixEnd2 = "(2) find the code that added the unwanted constraint or constraints and fix it."
        
        guard let range = range(of: prefixEnd1) ?? range(of: prefixEnd2) else {
            return self
        }
        
        return String(self[range.upperBound...])
    }
    
    func trimmingLogSuffix() -> String {
        
        let suffixStart = "Will attempt to recover by breaking constraint"
        
        guard let range = range(of: suffixStart) else {
            return self
        }
        
        return String(self[...range.lowerBound])
    }
}

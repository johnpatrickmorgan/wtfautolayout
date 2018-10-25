import Foundation

extension String {
    
    func removingBlankLines() -> String {
        
        return self
            .components(separatedBy: .newlines)
            .filter { !CharacterSet(charactersIn: $0).isSubset(of: .whitespaces) }
            .joined(separator: "\n")
    }
}

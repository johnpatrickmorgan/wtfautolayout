import Foundation

extension String {
    
    func removingBlankLines() -> String {
        
        return self
            .components(separatedBy: .newlines)
            // NOTE: The following line crashes on linux because of https://bugs.swift.org/browse/SR-4922
            // .filter { !CharacterSet(charactersIn: $0).isSubset(of: .whitespaces) }
            // Hence, the more convoluted version below:
            .filter { $0.unicodeScalars.contains(where: { CharacterSet.whitespaces.inverted.contains($0) }) }
            .joined(separator: "\n")
    }
}

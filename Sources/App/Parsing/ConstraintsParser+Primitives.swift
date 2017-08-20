import Foundation
import Sparse

// MARK: - Primitives

extension ConstraintsParser {
    
    static let wss = whitespaces()
    static let wsnls = whitespacesOrNewlines()
    static let colon = character(":")
    static let dot = character(".")
    static let sqm = character("'")
    static let dash = character("-")
    static let hexit = character(in: "0123456789abcdefABCDEF")
    static let digit = character(in: "0123456789")
    static let integer = atLeastOne(digit).asString()
}

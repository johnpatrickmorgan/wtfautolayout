import Foundation
import Sparse

// MARK: - Primitives

extension ConstraintsParser {
    
    static let wss = whitespaces()
    static let al1ws = atLeastOne(whitespace()).asString()
    static let wsnls = whitespacesOrNewlines()
    static let colon = character(":")
    static let dot = character(".")
    static let sqm = character("'")
    static let dash = character("-")
    static let hexit = character(in: "0123456789abcdefABCDEF")
        .named("hexit")
    static let digit = character(in: "0123456789")
        .named("digit")
    static let integer = atLeastOne(digit).asString()
}

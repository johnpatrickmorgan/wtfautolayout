import Foundation
import Sparse

// MARK: - Instances
// (e.g. "UIImageView:0x7fd382f50 'avatar'")

extension ConstraintsParser {
    
    static let instance = className.then(address).thenSkip(optional(fileLocation)).thenSkip(wss).then(optional(identifier))
        .map(flatten)
        .map { Instance(className: $0, address: $1, identifier: $2) }
    
    static let infoInstance = classOrName.then(address).thenSkip(optional(fileLocation)).thenSkip(wss).then(optional(identifier))
        .map(flatten)
        .map { Instance(className: $0, address: $1, identifier: $2) }
    
    static let constraintInstance = className.then(address).thenSkip(optional(fileLocation)).thenSkip(wss).then(isFromAutoresizingMask).thenSkip(wss).then(optional(identifier))
        .map(flatten)
        .map { (Instance(className: $0, address: $1, identifier: $3), $2) }
    
    static let partialInstance = instance.map({ PartialInstance.instance($0) }).otherwise(partialInstanceIdentifier)
}

private extension ConstraintsParser {

    static let className = many(character(condition: isClassNameCharacter), untilSkipping: colon).asString()
    static let address = string("0x").then(many(hexit)).map { "\($0.0)\(String($0.1))" }
    static let identifier = many(characterNot("'"), boundedBy: sqm).asString()
    static let fileLocation = string("@").skipThen(many(character(condition: isClassNameCharacter), untilSkipping: character("#")).asString()).then(integer)

    static let partialInstanceIdentifier = many(characterNot(in: "[]|()\n<>\""), untilSkipping: dotAttribute.withoutConsuming()).asString()
        .map { PartialInstance.identifier($0) }
    
    static let classOrName = many(anyCharacter(), untilSkipping: colon).asString()
    
    static let isFlexible = character(in: "&-").map { $0 == "&" }
    static let (h, v) = (string("h="), string("v="))
    static let autoresizingIntro = h.skipThen(exactly(3, isFlexible)).thenSkip(wss)
        .thenSkip(v).then(exactly(3, isFlexible)).thenSkip(wss)
    static let isFromAutoresizingMask = optional(autoresizingIntro).map { $0 != nil }
    
    static func isClassNameCharacter(_ character: Character) -> Bool {
        // NOTE: CharacterSet.union does not work on Linux. See https://bugs.swift.org/browse/SR-2509
        return CharacterSet.alphanumerics.contains(character.unicodeScalar()) || "._".characters.contains(character)
    }
}

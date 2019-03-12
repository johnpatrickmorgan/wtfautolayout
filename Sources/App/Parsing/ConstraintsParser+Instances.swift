import Foundation
import Sparse

// MARK: - Instances
// (e.g. "UIImageView:0x7fd382f50 'avatar'")

extension ConstraintsParser {
    
    static let instance = className.then(address).thenSkip(optional(fileLocation)).thenSkip(wss).then(optional(identifier))
        .map(flatten)
        .map { Instance(className: $0, address: $1, identifier: $2) }
        .named("instance")
    
    static let infoInstance = classOrName.then(address).thenSkip(optional(fileLocation)).thenSkip(wss).then(optional(identifier))
        .map(flatten)
        .map { Instance(className: $0, address: $1, identifier: $2) }
        .named("info instance")
    
    static let constraintInstance = className.then(address).thenSkip(optional(fileLocation)).thenSkip(al1ws)
        .then(isFromAutoresizingMask.thenSkip(wss))
        .then(optional(identifier.thenSkip(al1ws)))
        .map(flatten)
        .map { (Instance(className: $0, address: $1, identifier: $3), $2) }
        .named("constraint instance")
    
    static let partialInstance = instance.map({ PartialInstance.instance($0) }).otherwise(partialInstanceIdentifier)
}

private extension ConstraintsParser {

    static let classNameCharacter = character(condition: isClassNameCharacter)
        .named("valid class name character")
    static let className = many(classNameCharacter, untilSkipping: colon).asString()
    static let address = string("0x").then(many(hexit)).map { "\($0.0)\(String($0.1))" }
        .named("memory address")
    static let identifier = many(identifierCharacter.butNot(sqm), boundedBy: sqm).asString()
        .named("identifier")
    static let fileLocation = character("@").skipThen(many(anyCharacter(), untilSkipping: character("#")).asString()).then(integer)
        .named("file location")

    static let partialIdentifierCharacter = characterNot(in: "[]|()<>\":")
        .named("valid partial identifier character")
    static let partialInstanceIdentifier = many(identifierCharacter.and(partialIdentifierCharacter), untilSkipping: dotAttribute.withoutConsuming()).asString()
        .map { PartialInstance.identifier($0) }
    
    static let classOrName = many(identifierCharacter, untilSkipping: colon).asString()
    
    static let isFlexible = character(in: "&-").map { $0 == "&" }
    static let (h, v) = (string("h="), string("v="))
    static let autoresizingIntro = h.skipThen(exactly(3, isFlexible)).thenSkip(wss)
        .thenSkip(v).then(exactly(3, isFlexible)).thenSkip(wss)
    static let isFromAutoresizingMask = optional(autoresizingIntro).map { $0 != nil }
        .named("autoresizing mask info")
    
    static func isClassNameCharacter(_ character: Character) -> Bool {
        return CharacterSet.classNameCharacters.contains(character.unicodeScalar())
    }
}

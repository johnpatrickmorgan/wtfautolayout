import Foundation
import Sparse

// MARK: - Info
// (e.g. "(Names: '|':UIView:0x1f5a3120 )")
// (e.g. "(active, names: LoansListViewOptionsLabel...:0x7fa4d60764b0, '|':UIView:0x7fa4d6079490 )")

extension ConstraintsParser {
    
    static let optionalInfo = optional(info).map { $0 ?? [:] }
}

extension ConstraintsParser {
    
    static let active = string("active")
    static let names = string("names:").otherwise(string("Names:")).thenSkip(wss)
    static let key = many(characterNot(in: CharacterSet(charactersIn: ":' "))).asString()
    static let quotableKey = optional(character("'")).skipThen(key).thenSkip(optional(character("'")))
        .named("key")
    static let keyValuePair = infoInstance.map { ($0.className, $0) }.otherwise((quotableKey.thenSkip(character(":")).then(infoInstance)))
        .named("key value pair")
    static let commaSeparator = string(", ")
    static let keyValuePairs = many(keyValuePair, separator: commaSeparator).map { Dictionary(uniqueKeysWithValues: $0) }
    static let namesDictionary = names.skipThen(wss).skipThen(keyValuePairs).thenSkip(wss)
    static let emptyInfo = character("(").skipThen(active).thenSkip(character(")")).map { _ in return [String: Instance]() }
    static let nonEmptyInfo = character("(").skipThen(optional(active.then(commaSeparator))).skipThen(namesDictionary).thenSkip(wss).thenSkip(character(")"))
    static let info = wss.skipThen(nonEmptyInfo.otherwise(emptyInfo))
        .named("info")
}

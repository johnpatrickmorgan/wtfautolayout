import Foundation

extension CharacterSet {
    
    static var classNameCharacters: CharacterSet = alphanumerics.union(CharacterSet(charactersIn: "._"))
}

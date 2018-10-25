import Foundation

extension CharacterSet {
    
    static var classNameCharacters: CharacterSet = alphanumerics.union(CharacterSet(charactersIn: "._"))
    
    static var urlQueryArgumentAllowed: CharacterSet = urlQueryAllowed.subtracting(CharacterSet(charactersIn: "=&"))
}

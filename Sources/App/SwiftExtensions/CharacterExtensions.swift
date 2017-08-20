import Foundation

extension Character {
    
    func unicodeScalar() -> UnicodeScalar {
        
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex]
    }
}

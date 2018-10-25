import Foundation

struct InvalidConstraintError: Error, CustomStringConvertible {
    
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    var description: String {
        return "INVALID CONSTRAINT:\n\(message)."
    }
}

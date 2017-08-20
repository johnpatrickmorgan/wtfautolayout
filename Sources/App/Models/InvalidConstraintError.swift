import Foundation

struct InvalidConstraintError: Error, CustomStringConvertible {
    
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    var description: String {
        return "Invalid Constraint: \(message)."
    }
}

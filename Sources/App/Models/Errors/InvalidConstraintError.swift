import Foundation
import Sparse

struct InvalidConstraintError: ContextDescribableError, CustomStringConvertible {
    
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    var description: String {
        return "INVALID CONSTRAINT:\n\(message)."
    }
}

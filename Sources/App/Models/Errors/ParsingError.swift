import Foundation
import Sparse

protocol ParsingError: Error {
    
    var parsingErrorDescription: String { get }
}

extension UnexpectedInputError: ParsingError {
    
    var parsingErrorDescription: String {
        
        return description
    }
}

extension InvalidConstraintError: ParsingError {
    
    var parsingErrorDescription: String {
        
        return description
    }
}

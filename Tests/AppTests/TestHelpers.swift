import XCTest
import Foundation

@discardableResult func shouldNotThrow<O>(message: String = "", file: StaticString = #file, line: UInt = #line, _ closure: (Void) throws -> O) -> O? {
    
    do {
        return try closure()
    } catch {
        XCTFail("Unexpected error thrown: \(message)\n\(error)", file: file, line: line)
        return nil
    }
}

@discardableResult func shouldThrow<O>(message: String = "", file: StaticString = #file, line: UInt = #line, _ closure: (Void) throws -> O) -> Error? {
    
    do {
        let output = try closure()
        XCTFail("Error not thrown as expected: \(message)\nReturned: \(output)", file: file, line: line)
        return nil
    } catch {
        return error
    }
}

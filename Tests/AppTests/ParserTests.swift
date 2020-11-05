import XCTest
@testable import App
import Sparse
import SnapshotTesting

class ParserTests: XCTestCase {
    
    static let allTests = [
        ("testCustomInputs", testCustomInputs),
        ("testStackOverflowInputs", testStackOverflowInputs)
    ]
    
    func testCustomInputs() throws {
        
        let inputs = [
            Input.custom1,
            Input.custom2,
            Input.custom3,
            Input.custom4,
            Input.custom5,
            Input.custom6,
            Input.custom7,
            Input.custom8
        ]
        
        for input in inputs {
            let parsed = try ConstraintsParser.parse(input: input)
            assertSnapshot(matching: parsed.leafNode(), as: .json)
        }
    }
    
    func testGitHubIssues() throws {
        
        let inputs = [
            Input.issue1,
            Input.issue2,
            Input.issue4,
            Input.issue5,
            Input.issue10,
            Input.issue13,
            Input.issue16,
            Input.issue18,
            Input.issue20
        ]
        
        for input in inputs {
            let parsed = try ConstraintsParser.parse(input: input)
            assertSnapshot(matching: parsed.leafNode(), as: .json)
        }
    }
    
    func testStackOverflowInputs() throws {
        
        let inputs = [
            Input.so45163786,
            Input.so45452294,
            Input.so45474345,
            Input.so45487045
        ]
        
        for input in inputs {
            let parsed = try ConstraintsParser.parse(input: input)
            assertSnapshot(matching: parsed.leafNode(), as: .json)
        }
    }
}

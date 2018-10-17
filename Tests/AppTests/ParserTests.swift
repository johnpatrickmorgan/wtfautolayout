import XCTest
@testable import App
import Sparse
import SnapshotTesting

class ParserTests: SnapshotTestCase {
    
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
            Input.custom7
        ]
        
        for input in inputs {
            let parsed = try ConstraintsParser.parse(input: input)
            assertSnapshot(matching: parsed.leafNode())
        }
    }
    
    func testGitHubIssues() throws {
        
        let inputs = [
            Input.issue1,
            Input.issue2,
            Input.issue4,
            Input.issue5,
            Input.issue10
        ]
        
        for input in inputs {
            let parsed = try ConstraintsParser.parse(input: input)
            assertSnapshot(matching: parsed.leafNode())
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
            assertSnapshot(matching: parsed.leafNode())
        }
    }
}

extension ConstraintGroup.LeafNode: DefaultDiffable {
    
    public static var defaultStrategy: Strategy<ConstraintGroup.LeafNode, String> { return .json }
}

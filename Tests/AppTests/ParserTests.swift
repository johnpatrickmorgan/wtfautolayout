import XCTest
@testable import App
import Sparse

class ParserTests: XCTestCase {
    
    static let allTests = [
        ("testCustomInputs", testCustomInputs),
        ("testStackOverflowInputs", testStackOverflowInputs),
        ("testNumberParser", testNumberParser),
        ("testInfoParser", testInfoParser),
        ("testAttributeParser", testAttributeParser)
    ]
    
    func testCustomInputs() {
        
        let inputs = [
            ParserTests.custom1,
            ParserTests.custom2,
            ParserTests.custom3,
            ParserTests.custom4,
            ParserTests.custom5,
            ParserTests.custom6,
            ParserTests.custom7,
            ParserTests.custom8
        ]
        
        for input in inputs {
            shouldNotThrow {
                try ConstraintsParser.parse(log: input)
            }
        }
    }
    
    func testStackOverflowInputs() {
        
        let inputs = [
            ParserTests.so45163786,
            ParserTests.so45452294,
            ParserTests.so45474345,
            ParserTests.so45487045
        ]
        
        for input in inputs {
            shouldNotThrow {
                try ConstraintsParser.parse(log: input)
            }
        }
    }
    
    func testNumberParser() {
        
        let parser = ConstraintsParser.number
        let exponential = "3.2e3"
        let output = try? parser._run(Stream(exponential))
        XCTAssertEqual(output, 3200.0)
    }
    
    func testInfoParser() {
        
        let parser = ConstraintsParser.optionalInfo
        let input = "(active, names: LoansListViewOptionsLabel...:0x7fa4d60764b0, '|':UIView:0x7fa4d6079490 )"
        guard let output = shouldNotThrow({ try parser._run(Stream(input)) }) else { return }
        let expected = [
            "LoansListViewOptionsLabel...": Instance(className: "LoansListViewOptionsLabel...", address: "0x7fa4d60764b0", identifier: nil),
            "|": Instance(className: "UIView", address: "0x7fa4d6079490", identifier: nil)
        ]
        XCTAssertEqual(expected, output)
    }
    
    func testAttributeParser() {
        
        let parser = ConstraintsParser.attribute
        let width = "width"
        guard let output = shouldNotThrow({ try parser._run(Stream(width)) }) else { return }
        let expected = Attribute.width
        XCTAssertEqual(expected, output)
    }
}

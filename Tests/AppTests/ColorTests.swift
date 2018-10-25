import XCTest
@testable import App

class ColorTests: XCTestCase {
    
    static let allTests = [
        ("testHexConversion", testHexConversion)
    ]
    
    func testHexConversion() {
        
        typealias Expectation = (input: Int, output: String)
        
        let expectations: [Expectation] = [
            (0x1abc9c, "#1abc9c"),
            (0x16a085, "#16a085"),
            (0x2ecc71, "#2ecc71"),
            (0x27ae60, "#27ae60"),
            (0x3498db, "#3498db"),
            (0x2980b9, "#2980b9"),
            (0x19b5fe, "#19b5fe"),
            (0x9b59b6, "#9b59b6"),
            (0x8e44ad, "#8e44ad"),
            (0xf5d76e, "#f5d76e"),
            (0xf1c40f, "#f1c40f"),
            (0xf39c12, "#f39c12"),
            (0xe67e22, "#e67e22"),
            (0xd35400, "#d35400"),
            (0xe74c3c, "#e74c3c"),
            (0xc0392b, "#c0392b")
        ]
        
        for expectation in expectations {
            let output = Color(hex: expectation.input).hex
            XCTAssertEqual(output.lowercased(), expectation.output)
        }
    }
}

import XCTest
@testable import App
import Vapor
import SnapshotTesting

class ViewTests: XCTestCase {
    
    override static func setUp() {
//        SnapshotTesting.record = true
    }
    
    static let allTests = [
        ("testHome", testHome),
        ("testAbout", testAbout),
        ("testPostError", testPostError),
        ("testPostOutput", testPostOutput),
        ("testQueryOutput", testQueryOutput),
    ]
    
    func testHome() throws {
        let app = try App.app(.testing)
        let response = try app.get()
        
        assertSnapshot(matching: response.description, as: .lines)
    }
    
    func testAbout() throws {
        let app = try App.app(.testing)
        let url = URL(string: "/about")!
        let response = try app.get(url: url)
        
        assertSnapshot(matching: response.description, as: .lines)
    }
    
    func testPostError() throws {
        let inputs = [
            Input.invalidHexitError
        ]
        
        for input in inputs {
            let app = try App.app(.testing)
            let body = ConstraintLogRequest(constraintlog: input)
            let response = try app.postJSON(body: body)
            
            assertSnapshot(matching: response.description, as: .lines)
        }
    }
    
    func testPostOutput() throws {
        let inputs = [
            Input.custom1,
            Input.custom2,
            Input.custom3,
            Input.custom4,
            Input.custom5,
            Input.custom6,
            Input.custom7,
            Input.custom8,
            Input.custom9
        ]
        
        for input in inputs {
            let app = try App.app(.testing)
            let body = ConstraintLogRequest(constraintlog: input)
            let response = try app.postJSON(body: body)
            
            assertSnapshot(matching: response.description, as: .lines)
        }
    }
    
    func testQueryOutput() throws {
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
            let app = try App.app(.testing)
            let log = input.addingPercentEncoding(withAllowedCharacters: .urlQueryArgumentAllowed)!
            let url = URL(string: "/?constraintlog=\(log)")!
            let response = try app.get(url: url)
            
            assertSnapshot(matching: response.description, as: .lines)
        }
    }
}

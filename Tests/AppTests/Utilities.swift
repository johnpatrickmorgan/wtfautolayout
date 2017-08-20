import Foundation
@testable import App
@testable import Vapor
import XCTest
import Testing

extension Droplet {
    static func testable() throws -> Droplet {
        let config = try Config(arguments: ["vapor", "--env=test"])
        try config.setup()
        let drop = try Droplet(config)
        try drop.setup()
        return drop
    }
    func serveInBackground() throws {
        background {
            try! self.run()
        }
        console.wait(seconds: 0.5)
    }
}

class TestCase: XCTestCase {
    override func setUp() {
        Node.fuzzy = [JSON.self, Node.self]
        Testing.onFail = XCTFail
    }
}

final class TestViewRenderer: ViewRenderer {
    var shouldCache = false
    /// Creates a view at the supplied path
    /// using a Node that is made optional
    /// by various protocol extensions.
    func make(_ path: String, _ context: Node) throws -> View {
        var json = JSON()
        try json.set("path", path)
        try json.set("context", context)
        return try View(bytes: json.makeBytes())
    }
}

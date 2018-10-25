import Foundation
import Vapor

extension Application {
    
    func make(request: HTTPRequest) throws -> Response {
        let wrappedRequest = Request(http: request, using: self)
        let responder = try make(Responder.self)
        return try responder.respond(to: wrappedRequest).wait()
    }
    
    func get(
        url: URLRepresentable = URL.root,
        version: HTTPVersion = .init(major: 1, minor: 1),
        headers: HTTPHeaders = .init()
    ) throws -> Response {
        let request = HTTPRequest(method: .GET, url: url, version: version, headers: headers, body: HTTPBody())
        return try make(request: request)
    }
    
    func postJSON<T: Encodable>(
        url: URLRepresentable = URL.root,
        version: HTTPVersion = .init(major: 1, minor: 1),
        headers: HTTPHeaders = .init(),
        body: T
    ) throws -> Response {
        let encoder = JSONEncoder()
        let body = try HTTPBody(data: encoder.encode(body))
        var amendedHeaders = headers
        amendedHeaders.add(name: "Content-Type", value: "application/json")
        let request = HTTPRequest(method: .POST, url: url, version: version, headers: amendedHeaders, body: body)
        return try make(request: request)
    }
}

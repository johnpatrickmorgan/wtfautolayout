@_exported import Vapor
import Sparse

extension Droplet {
    
    public func setup() throws {
        
        get { req in
            
            if let input = req.data["constraintlog"]?.string {
                return try outputView(for: input, includePermalink: false)
            }

            let showExample = req.data["example"]?.bool ?? false
            let context: Node = [
                "prefill" : showExample ? .string(ConstraintsParser.randomExample()) : .null,
                "page": "home"
            ]
            
            return try self.view.make("input", context)
        }
        
        post { req in
            
            guard let input = req.data["constraintlog"]?.string else {
                throw Abort.badRequest
            }
            
            return try outputView(for: input)
        }
        
        get("about") { req in
            
            let context: Node = [
                "page": "about"
            ]
            return try self.view.make("about", context)
        }

        func outputView(for input: String, includePermalink: Bool = true) throws -> View {
            
            do {
                let constraints = try ConstraintsParser.parse(log: input)
                let group = ConstraintGroup(constraints, raw: input)
                var node = try group.makeNode(in: nil, includePermalink: includePermalink)
                node["page"] = "output"
                
                return try self.view.make("output", node)
                
            } catch let error as UnexpectedInputError {
                
                let context: Node = [
                    "prefill": .string(input),
                    "error": .string("\(error)"),
                    "page": "error"
                ]
                
                log.error(["UNEXPECTED INPUT ERROR:", input, "\(error)"].joined(separator: "\n"))
                
                return try self.view.make("input", context)
                
            } catch let error as InvalidConstraintError {
            
                let context: Node = [
                    "prefill": .string(input),
                    "error": .string("\(error)"),
                    "page": "error"
                ]
                
                log.error(["INVALID CONSTRAINT ERROR:", input, "\(error)"].joined(separator: "\n"))
                
                return try self.view.make("input", context)
                
            } catch {
                
                throw Abort.badRequest
            }
        }
    }
}

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
                let constraints = try ConstraintsParser.parse(log: input.trimmingLogAffixes())
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

fileprivate extension String {
    
    func trimmingLogAffixes() -> String {
        
        return self.trimmingLogSuffix().trimmingLogPrefix()
    }
    
    func trimmingLogPrefix() -> String {
        
        let prefixEnd1 = "(Note: If you're seeing NSAutoresizingMaskLayoutConstraints that you don't understand, refer to the documentation for the UIView property translatesAutoresizingMaskIntoConstraints)"
        let prefixEnd2 = "(2) find the code that added the unwanted constraint or constraints and fix it."
        
        guard let range = range(of: prefixEnd1) ?? range(of: prefixEnd2) else {
            return self
        }
        
        return substring(from: range.upperBound)
    }
    
    func trimmingLogSuffix() -> String {
        
        let suffixStart = "Will attempt to recover by breaking constraint"
        
        guard let range = range(of: suffixStart) else {
            return self
        }
        
        return substring(to: range.lowerBound)
    }
}

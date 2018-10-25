import Vapor

struct ConstraintLogRequest: Codable {
    
    let constraintlog: String
}

/// Register your application's routes here.
public func routes(_ router: Router) throws {
        
    router.get { (req: Request) -> Future<View> in

        if let input = (try? req.query.get(String.self, at: "constraintlog")) {
            return try outputView(req: req, for: input, includePermalink: false)
        }

        let showExample = (try? req.query.get(Bool.self, at: "example")) ?? false
        var context = [
            "page": "home"
        ]
        if showExample {
            context["prefill"] = ConstraintsParser.randomExample()
        }

        return try req.view().render("input", context)
    }

    router.post { (req: Request) -> Future<View> in

        guard let request = try? req.content.syncDecode(ConstraintLogRequest.self) else {
            // TODO
            //            throw Abort.badRequest
            fatalError()
        }

        return try outputView(req: req, for: request.constraintlog)
    }

    router.get("about") { req in
        return try req.view()
            .render("about", [
                "page": "about"
            ])
    }
}

private func outputView(req: Request, for input: String, includePermalink: Bool = true) throws -> Future<View> {
    
    let trimmedInput = input
        .trimmingLogAffixes()
        .removingBlankLines()
        .trimmingCharacters(in: .whitespaces)
    
    do {
        let group = try ConstraintsParser.parse(input: trimmedInput)
        let node = group.leafNode(includePermalink: includePermalink)
//        node["page"] = "output" // TODO
        
        return try req.view().render("output", node)
        
    } catch let error as ParsingError {
        
        let context = [
            "prefill": trimmedInput,
            "error": error.parsingErrorDescription,
            "page": "error"
        ]
        // TODO
//        log.error(["PARSING ERROR:", trimmedInput, error.parsingErrorDescription].joined(separator: "\n"))
        
        return try req.view().render("input", context)
    }
//    } catch {
//
//        throw Abort.badRequest
//    }
}

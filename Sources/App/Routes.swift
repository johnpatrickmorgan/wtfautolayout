import Vapor

public func routes(_ router: Router) throws {
        
    router.get { (req: Request) -> Future<View> in
        if let input = (try? req.query.get(String.self, at: "constraintlog")) {
            return try OutputController(input: input, includePermalink: false).view(req: req)
        }

        let showExample = (try? req.query.get(Bool.self, at: "example")) ?? false
        if showExample {
            let context = ["prefill": ConstraintsParser.randomExample()]
            return try req.view().render("input", context)
        } else {
            return try req.view().render("input")
        }
    }

    router.post { (req: Request) -> Future<View> in
        let input = try req.content.syncDecode(ConstraintLogRequest.self).constraintlog
        return try OutputController(input: input).view(req: req)
    }

    router.get("about") { req in
        return try req.view().render("about")
    }
}

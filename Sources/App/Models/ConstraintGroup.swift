import Foundation

typealias Annotation = (color: Color, uniquingSuffix: String?)

struct ConstraintGroup {
    
    let raw: String
    let layoutItems: [Instance]
    let constraints: [Constraint]
    let annotations: [Instance : Annotation]
    
    private static func annotations(for layoutItems: [Instance]) -> [Instance : Annotation] {
        
        let names = layoutItems.map { $0.prettyName }
        
        var uniquingSuffixes = [String]()
        var counts = [String : Int]()
        
        for name in names {
            let number = (counts[name] ?? 0) + 1
            counts[name] = number
            uniquingSuffixes.append(String(number))
        }
        
        var annotations = [Instance : Annotation]()
        for (i, item) in layoutItems.enumerated() {
            
            let requiresUniquing = (counts[item.prettyName] ?? 0) > 1
            let uniquingSuffix: String? = requiresUniquing ? uniquingSuffixes[i] :
                nil
            let color = Color.flatColor(index: i)
            
            annotations[item] = (color: color, uniquingSuffix: uniquingSuffix)
        }
        
        return annotations
    }
    
    init(_ constraints: [Constraint], raw: String) {
        
        self.raw = raw
        self.constraints = constraints
        self.layoutItems = Array(Set(constraints.flatMap { $0.layoutItems }))
        self.annotations = ConstraintGroup.annotations(for: layoutItems)
    }
}

extension ConstraintGroup {

    var includesAutoResizingMaskConstraints: Bool {
        return constraints.contains(where: { $0.origin == .autoresizingMask })
    }
    
    var footnotes: Set<Footnote> {
        return Set(constraints.flatMap { $0.footnote })
    }
}

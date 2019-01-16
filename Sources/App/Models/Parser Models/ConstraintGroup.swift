import Foundation
import Random

typealias Annotation = (color: Color, uniquingSuffix: String)

struct ConstraintGroup {
    
    let raw: String
    let constraints: [Constraint]
    let annotations: [Instance : Annotation]
    
    private static func annotations(for layoutItems: [Instance], seed: Int) -> [Instance : Annotation] {
        
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
            // Adding a seed value ensures the color scheme can differ per input while
            // remaining deterministic.
            let color = Color.flatColor(index: i + abs(seed))
            
            let requiresUniquing = (counts[item.prettyName] ?? 0) > 1
            let uniquingSuffix = requiresUniquing ? uniquingSuffixes[i] : ""
            
            annotations[item] = (color: color, uniquingSuffix: uniquingSuffix)
        }
        
        return annotations
    }
    
    init(_ constraints: [Constraint], raw: String) {
        
        self.raw = raw
        self.constraints = constraints
        let layoutItems = Set(constraints.flatMap { $0.layoutItems })
        self.annotations = ConstraintGroup.annotations(for: Array(layoutItems), seed: raw.count)
    }
}

extension ConstraintGroup {

    var includesAutoResizingMaskConstraints: Bool {
        return constraints.contains(where: { $0.origin == .autoresizingMask })
    }
    
    var footnotes: Set<Footnote> {
        return Set(constraints.compactMap { $0.footnote })
    }
}

import Foundation
import Vapor

private let maximumPermalinkLength = 2000

extension ConstraintGroup {

    struct LeafNode: Codable {
        let constraints: [Constraint.LeafNode]
        let permalink: String?
        let footnotes: [Footnote.LeafNode]
    }

    func leafNode(includePermalink: Bool = false) -> LeafNode {
        
        var permalink: String? {
            let trimmed = raw.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return (trimmed?.count ?? 0) < maximumPermalinkLength ? trimmed : nil
        }
        
        return .init(
            constraints: constraints.map { $0.leafNode(annotations: annotations) },
            permalink: includePermalink ? permalink : nil,
            footnotes: footnotes.map { $0.leafNode() }
        )
    }
}

extension Constraint {
    
    struct LeafNode: Codable {
        let identity: Instance.LeafNode
        let first: LayoutItemAttribute.LeafNode
        let second: LayoutItemAttribute.LeafNode?
        let relation: Relation.LeafNode
        let constant: Constant.LeafNode?
        let multiplier: Multiplier.LeafNode
        let description: String
        let footnote: Footnote.LeafNode?
    }
    
    func leafNode(annotations: [Instance: Annotation]) -> LeafNode {
        
        let showConstant = constant.value != 0.0 || second == nil
        return .init(
            identity: identity.leafNode(),
            first: first.leafNode(annotation: annotations[first.layoutItem]),
            second: second?.leafNode(annotation: second.flatMap { annotations[$0.layoutItem] }),
            relation: relation.leafNode(),
            constant: showConstant ? constant.leafNode(includePositivePrefix: second != nil) : nil,
            multiplier: multiplier.leafNode(),
            description: htmlDescription(annotations: annotations),
            footnote: footnote?.leafNode()
        )
    }
}

extension LayoutItemAttribute {
    
    struct LeafNode: Codable {
        let instance: Instance.LeafNode
        let attribute: Attribute.LeafNode
    }
    
    func leafNode(annotation: Annotation?) -> LeafNode {
        
        return .init(
            instance: layoutItem.leafNode(annotation: annotation),
            attribute: attribute.leafNode()
        )
    }
}

extension Instance {
    
    struct LeafNode: Codable {
        let address: String
        let className: String
        let name: String
        let suffix: String?
        let color: Color.LeafNode
        let initial: String
        let identifier: String?
    }
    
    func leafNode(annotation: Annotation? = nil) -> LeafNode {
        let firstAlphanumeric = prettyName.unicodeScalars.first { CharacterSet.alphanumerics.contains($0) }
        let initial = firstAlphanumeric.map { String($0).uppercased() } ?? ""
        return .init(
            address: address,
            className: className,
            name: prettyName,
            suffix: annotation.map { $0.uniquingSuffix },
            color: (annotation?.color ?? .defaultColor).leafNode(),
            initial: initial,
            identifier: identifier
        )
    }
}

extension Attribute {
    
    struct LeafNode: Codable {
        let name: String
        let includesMargin: Bool
    }
    
    func leafNode() -> LeafNode {
        
        return .init(
            name: rawValue,
            includesMargin: includesMargin
        )
    }
}

extension Constraint.Relation {
    
    typealias LeafNode = String
    
    func leafNode() -> LeafNode {
        return rawValue
    }
}

extension Multiplier {
    
    typealias LeafNode = String?
    
    func leafNode() -> LeafNode {
        guard value != 1.0 else { return nil }
        return "* \(format(number: value, maximumFractionDigits: 3))"
    }
}

extension Constant {
    
    struct LeafNode: Codable {
        let value: String
        let prefix: String?
    }
    
    func leafNode(includePositivePrefix: Bool) -> LeafNode {
        
        return .init(
            value: format(number: abs(value)),
            prefix: value < 0 ? "- " : includePositivePrefix ? "+ " : nil
        )
    }
}

extension Color {
    
    typealias LeafNode = String
    
    func leafNode() -> LeafNode {
        
        return rgb
    }
}

extension Footnote {
    
    struct LeafNode: Codable {
        let marker: String
        let text: String
    }
    
    func leafNode() -> LeafNode {
        
        return .init(
            marker: marker,
            text: htmlText
        )
    }
}

import Foundation
import Random

extension ConstraintsParser {
    
    private static let example1 = """
        (
          "<NSLayoutConstraint:0x69c2f0 UIImageView:0x7fd382f50.height == 60>",
          "<NSLayoutConstraint:0x69a8b0 UIImageView:0x7fd382f50.top == UITableViewCell:0x7fd39b20.top>",
          "<NSLayoutConstraint:0x697ca0 UITableViewCell:0x7fd39b20.bottom == UIImageView:0x7fd382f50.bottom>",
          "<NSLayoutConstraint:0x697d40 'UIView-Encapsulated-Layout-Height' UITableViewCell:0x7fd39b20.height == 80>\"
        )
        """
    
    private static let example2 = """
        (
          "<NSLayoutConstraint:0x134580 name_label.height == 25 (active, names: name_label:0x104590 )>",
          "<NSLayoutConstraint:0x145cc0 name_label.height >= 50 (active, names: name_label:0x104590 )>"
        )
        """
    
    private static let example3 = """
        (
          "<NSLayoutConstraint:0x6199cd0 UIButton:0x7fbbf90.width == 0 (active)>",
          "<NSLayoutConstraint:0x6998ec0 H:|-(15)-[UILabel:0x6ce60] (active, names: '|':UIButton:0x7fbbf90 )>",
          "<NSLayoutConstraint:0x6199000 H:[UILabel:0x6ce60]-(15)-| (active, names: '|':UIButton:0x7fbbf90 )>"
        )
        """
    
    static func randomExample() -> String {
        let examples = [
            example1,
            example2,
            example3
        ]
        return examples.randomElement()!
    }
}

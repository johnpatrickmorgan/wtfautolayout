import Foundation

extension ConstraintsParser {
    
    private static func example1() -> String {
        
        return [
            "(",
            "    \"<NSLayoutConstraint:0x69c2f0 UIImageView:0x7fd382f50.height == 60>\",",
            "    \"<NSLayoutConstraint:0x69a8b0 UIImageView:0x7fd382f50.top == UITableViewCell:0x7fd39b20.top>\",",
            "    \"<NSLayoutConstraint:0x697ca0 UITableViewCell:0x7fd39b20.bottom == UIImageView:0x7fd382f50.bottom>\",",
            "    \"<NSLayoutConstraint:0x697d40 'UIView-Encapsulated-Layout-Height' UITableViewCell:0x7fd39b20.height == 80>\"",
            ")"
            ].joined(separator: "\n")
    }
    
    static func randomExample() -> String {
        
        return example1()
    }
}

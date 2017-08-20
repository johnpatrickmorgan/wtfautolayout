import Foundation

struct Instance {
    
    let className: String
    let address: String
    let identifier: String?
}

extension Instance: Equatable, Hashable {
    
    public static func ==(lhs: Instance, rhs: Instance) -> Bool {
        
        return lhs.address == rhs.address
    }
    
    public var hashValue: Int {
        
        return address.hashValue
    }
}

extension Instance {
    
    var shortClassName: String {
        return className.components(separatedBy: ".").lazy.filter({ !$0.isEmpty }).last ?? className
    }
    
    var prettyTypeName: String {
        
        let simpleTypes = [
            "LayoutMarginsGuide",
            "LayoutGuide",
            "Label",
            "Button",
            "Slider",
            "ImageView",
            "Cell",
            "TextField",
            "Switch",
            "Picker",
            "Window",
            "SegmentedControl",
            "TableView",
            "CollectionView",
            "View"
        ]
        
        return simpleTypes.first(where: { className.hasSuffix($0) }) ?? shortClassName
    }
    
    var prettyName: String {
        
        return prettyTypeName
    }
}

struct LayoutItemAttribute {
    
    let layoutItem: Instance
    let attribute: Attribute
}

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
        
        let prefixToTrim = "UI"
        
        guard shortClassName.hasPrefix(prefixToTrim) else {
            return shortClassName
        }
        
        return shortClassName.substring(from: prefixToTrim.endIndex)
    }
    
    var prettyName: String {
        
        return prettyTypeName
    }
}

struct LayoutItemAttribute {
    
    let layoutItem: Instance
    let attribute: Attribute
}

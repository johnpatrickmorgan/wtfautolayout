import Foundation

extension Dictionary {
    
    init(_ pairs: [Element]) {
        
        self.init()
        
        for (key, value) in pairs {
            self[key] = value
        }
    }
}

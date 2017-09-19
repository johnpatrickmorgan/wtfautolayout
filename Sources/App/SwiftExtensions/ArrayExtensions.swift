
import Foundation

extension Array where Element : Equatable {
    
    var uniqueElements: [Element] {
        
        var uniques = [Element]()
        for element in self where !uniques.contains(element) {
            uniques.append(element)
        }
        
        return uniques
    }
}

import Foundation

enum PartialInstance {
    
    case instance(Instance)
    case identifier(String)
    case superview
}

extension PartialInstance {

    func getInstance(names: [String: Instance]) throws -> Instance {
        switch self {
        case .instance(let instance):
            return instance
        case .identifier(let identifier):
            guard let instance = names[identifier] else {
                throw InvalidConstraintError("Missing info for \(identifier)")
            }
            return instance
        case .superview:
            guard let instance = names["|"] else {
                throw InvalidConstraintError("Missing info for '|' (superview)")
            }
            return instance
        }
    }
}

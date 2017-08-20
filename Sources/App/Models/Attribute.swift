import Foundation

enum Attribute: String {
    
    enum Axis: String {
        
        case horizontal
        case vertical
    }
    
    enum PinPoint {
        
        case start
        case end
        case center
        case extent
        case baseline
    }
    
    case leading
    case trailing
    case top
    case bottom
    case centerX
    case centerY
    case width
    case height
    case leadingMargin
    case trailingMargin
    case topMargin
    case bottomMargin
    case baseline
    
    static let allCases: [Attribute] = [
        .leading,
        .trailing,
        .top,
        .bottom,
        .centerX,
        .centerY,
        .width,
        .height,
        .leadingMargin,
        .trailingMargin,
        .topMargin,
        .bottomMargin,
        .baseline
    ]
    
    var alternativeLabels: [String] {
        switch self {
        case .leading:
            return ["left", "minX"]
        case .trailing:
            return ["right", "maxX"]
        case .centerX:
            return ["midX"]
        case .centerY:
            return ["midY"]
        case .top:
            return ["minY"]
        case .bottom:
            return ["maxY"]
        default:
            return []
        }
    }
    
    var labels: [String] {
        return [rawValue] + alternativeLabels
    }
    
    init(axis: Axis, pinPoint: PinPoint, includesMargin: Bool = false) throws {
        
        switch (pinPoint, axis, includesMargin) {
        case (.start, .horizontal, false):  self = .leading
        case (.end, .horizontal, false):    self = .trailing
        case (.start, .vertical, false):    self = .top
        case (.end, .vertical, false):      self = .bottom
        case (.center, .horizontal, _):     self = .centerX
        case (.center, .vertical, _):       self = .centerY
        case (.extent, .horizontal, _):     self = .width
        case (.extent, .vertical, _):       self = .height
        case (.start, .horizontal, true):   self = .leadingMargin
        case (.end, .horizontal, true):     self = .trailingMargin
        case (.start, .vertical, true):     self = .topMargin
        case (.end, .vertical, true):       self = .bottomMargin
        case (.baseline, .vertical, _):     self = .baseline
        default:
            throw InvalidConstraintError("\(axis) \(pinPoint)\(includesMargin ? "Margin" : "") is not a valid attribute")
        }
    }
    
    private var info: (pinPoint: PinPoint, axis: Axis, includesMargin: Bool) {
        
        switch self {
        case .leading:          return (.start, .horizontal, false)
        case .trailing:         return (.end, .horizontal, false)
        case .top:              return (.start, .vertical, false)
        case .bottom:           return (.end, .vertical, false)
        case .centerX:          return (.center, .horizontal, false)
        case .centerY:          return (.center, .vertical, false)
        case .width:            return (.extent, .horizontal, false)
        case .height:           return (.extent, .vertical, false)
        case .leadingMargin:    return (.start, .horizontal, true)
        case .trailingMargin:   return (.end, .horizontal, true)
        case .topMargin:        return (.start, .vertical, true)
        case .bottomMargin:     return (.end, .vertical, true)
        case .baseline:         return (.baseline, .vertical, false)
        }
    }
    var pinPoint: PinPoint {
        return info.pinPoint
    }
    var axis: Axis {
        return info.axis
    }
    var includesMargin: Bool {
        return info.includesMargin
    }
}


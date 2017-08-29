import Foundation

enum Footnote {
    
    case autoresizingMask
    case encapsulatedLayout
    case stackView
}

extension Footnote {
    
    var marker: String {
        switch self {
        case .autoresizingMask:
            return "*"
        case .encapsulatedLayout:
            return "†"
        case .stackView:
            return "‡"
        }
    }
    
    var htmlText: String {
        switch self {
        case .autoresizingMask:
            return "This constraint was translated from an autoresizing mask. If this was not intended, try setting <code>translatesAutoresizingMaskIntoConstraints</code> to false on this view."
        case .encapsulatedLayout:
            return "This constraint was added by a table or collection view to enforce its cell size."
        case .stackView:
            return "This constraint was added by a stack view to enforce its spacing, distribution or alignment."
        }
    }
}

import Foundation

struct Color {
    
    let r: Int
    let g: Int
    let b: Int
    
    var hex: String {
        
        return String(format: "#%02X%02X%02X", r, g, b)
    }
    
    var rgb: String {
        
        return "rgb(\(r),\(g),\(b))"
    }
}

extension Color {
    
    static func flatColor(index: Int) -> Color {
        
        let colors = [
            carrotColor(),
            emeraldColor(),
            peterRiverColor(),
            amethystColor(),
            sunflowerColor(),
            alizarinColor(),
            turquoiseColor()
        ]
        return colors[index % colors.count]
    }
    
    static func turquoiseColor() -> Color {
        return Color(r: 26, g: 188, b: 156)
    }
    
    static func emeraldColor() -> Color {
        return Color(r: 46, g: 204, b: 113)
    }
    
    static func peterRiverColor() -> Color {
        return Color(r: 52, g: 152, b: 219)
    }
    
    static func amethystColor() -> Color {
        return Color(r: 155, g: 89, b: 182)
    }
    
    static func sunflowerColor() -> Color {
        return Color(r: 241, g: 196, b: 15)
    }
    
    static func carrotColor() -> Color {
        return Color(r: 230, g: 126, b: 34)
    }
    
    static func alizarinColor() -> Color {
        return Color(r: 231, g: 76, b: 60)
    }
}

import Foundation

struct Color {
    
    let r: Int
    let g: Int
    let b: Int
    
    init(r: Int, g: Int, b: Int) {
        
        self.r = r
        self.g = g
        self.b = b
    }
    
    init(hex: Int) {
        
        let r = (hex & 0xFF0000) >> 16
        let g = (hex & 0x00FF00) >> 8
        let b = hex & 0x0000FF
        
        self.init(r: r, g: g, b: b)
    }
    
    var hex: String {
        
        return String(format: "#%02X%02X%02X", r, g, b)
    }
    
    var rgb: String {
        
        return "rgb(\(r),\(g),\(b))"
    }
}

extension Color: ExpressibleByIntegerLiteral {
    
    init(integerLiteral value: Int) {
        
        self.init(hex: value)
    }
}

extension Color {
    
    static func flatColor(index: Int) -> Color {
        
        let colors = [
            turquoise,
            peterRiver,
            sunflower,
            alizarin,
            emerald,
            amethyst,
            carrot,
            creamCorn,
            greenSea,
            belizeHole,
            orange,
            pomegranate,
            dodgerBlue,
            nephritis,
            wysteria,
            pumpkin,
        ]
        return colors[abs(index) % colors.count]
    }
    
    static let defaultColor = turquoise
    
    static let turquoise: Color = 0x1abc9c
    static let greenSea: Color = 0x16a085
    
    static let emerald: Color = 0x2ecc71
    static let nephritis: Color = 0x27ae60
    
    static let peterRiver: Color = 0x3498db
    static let belizeHole: Color = 0x2980b9
    static let dodgerBlue: Color = 0x19b5fe
    
    static let amethyst: Color = 0x9b59b6
    static let wysteria: Color = 0x8e44ad
    
    static let creamCorn: Color = 0xf5d76e
    static let sunflower: Color = 0xf1c40f
    static let orange: Color = 0xf39c12
    
    static let carrot: Color = 0xe67e22
    static let pumpkin: Color = 0xd35400
    
    static let alizarin: Color = 0xe74c3c
    static let pomegranate: Color = 0xc0392b
}

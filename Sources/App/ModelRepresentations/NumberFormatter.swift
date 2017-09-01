import Foundation

private let formatter = NumberFormatter()

func format(number: Double, maximumFractionDigits: Int = 1) -> String {
    
    formatter.maximumFractionDigits = maximumFractionDigits
    formatter.minimumIntegerDigits = 1
    formatter.paddingPosition = .beforePrefix
    formatter.paddingCharacter = "0"
        
    return formatter.string(from: NSNumber(value: number)) ?? String(format: "%.1f", number)
}

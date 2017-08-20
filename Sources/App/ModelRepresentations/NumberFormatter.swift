import Foundation

private let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 1
    return formatter
}()

func format(number: Double) -> String {
    return numberFormatter.string(from: NSNumber(value: number)) ?? String(format: "%.1f", number)
}

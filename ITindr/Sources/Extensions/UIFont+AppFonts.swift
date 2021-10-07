import UIKit

extension UIFont {
  // MARK: - Font names
  private struct FontNames {
    static let regular = "Montserrat-Regular"
    static let bold = "Montserrat-Bold"
  }
  
  static let body16 = UIFont.boldAppFont(ofSize: 16)
  static let body24 = UIFont.boldAppFont(ofSize: 24)
  
  static func appFont(ofSize size: CGFloat) -> UIFont {
    guard let font = UIFont(name: FontNames.regular, size: size) else {
      return .systemFont(ofSize: size, weight: .bold)
    }
    return font
  }
  
  static func boldAppFont(ofSize size: CGFloat) -> UIFont {
    guard let font = UIFont(name: FontNames.bold, size: size) else {
      return .systemFont(ofSize: size, weight: .bold)
    }
    return font
  }
}

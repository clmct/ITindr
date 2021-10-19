import UIKit

extension UIButton {
  func addLeftImage(image: UIImage?, offset: CGFloat) {
    self.setImage(image, for: .normal)
    self.imageView?.translatesAutoresizingMaskIntoConstraints = false
    self.imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
    self.imageView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset).isActive = true
    if let imageView = imageView {
      self.bringSubviewToFront(imageView)
    }
  }
}

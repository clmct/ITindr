//
//  UIView+Gradient.swift
//  ITindr
//

import UIKit

enum GradientDirection {
  case horizontal
  case vertical
  case custom(startPoint: CGPoint, endPoint: CGPoint)
}

private let gradientLayerName = "gradientLayer"

extension UIView {
  @discardableResult func addGradient(startColor: UIColor, endColor: UIColor, direction: GradientDirection) -> CAGradientLayer {
    return addGradient(colors: [startColor, endColor], direction: direction)
  }
  
  @discardableResult func addGradient(colors: [UIColor],
                                      direction: GradientDirection,
                                      locations: [NSNumber] = [0, 1]) -> CAGradientLayer {
    if let sublayers = layer.sublayers {
      for sublayer in sublayers where sublayer.name == gradientLayerName {
        sublayer.frame = bounds
      }
    }

    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.name = gradientLayerName
    gradientLayer.colors = colors.map { $0.cgColor }
    gradientLayer.locations = locations

    switch direction {
    case .vertical:
      gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
      gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    case .horizontal:
      gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    case .custom(let startPoint, let endPoint):
      gradientLayer.startPoint = startPoint
      gradientLayer.endPoint = endPoint
    }

    layer.insertSublayer(gradientLayer, at: 0)
    return gradientLayer
  }

  func updateGradientFrame() {
    layer.sublayers?.forEach { sublayer in
      if sublayer.name == gradientLayerName {
        sublayer.frame = bounds
      }
    }
  }

  func updateGradientColors(startColor: UIColor, endColor: UIColor) {
    layer.sublayers?.forEach { sublayer in
      if sublayer.name == gradientLayerName, let gradient = sublayer as? CAGradientLayer {
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        sublayer.frame = bounds
      }
    }
  }

  func removeGradient() {
    if let sublayer = layer.sublayers?.first(where: { $0.name == gradientLayerName }) {
      sublayer.removeFromSuperlayer()
    }
  }
}

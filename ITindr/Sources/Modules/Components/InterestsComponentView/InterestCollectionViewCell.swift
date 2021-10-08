import UIKit

final class InterestCollectionViewCell: UICollectionViewCell {
  static let identifier = "InterestCollectionViewCell"
  
  private let button = UIButton(type: .system)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(text: String, isSelected: Bool) {
    button.setTitle(text)
    switch isSelected {
    case false:
      button.setTitleFont(.regular14)
      button.setTitleColor(.base1)
      button.backgroundColor = .base0
    case true:
      button.setTitleFont(.bold14)
      button.setTitleColor(.base0)
      button.backgroundColor = .base1
    }
  }
  
  private func setup() {
    addSubview(button)
    button.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.height.equalTo(24)
    }
    
    button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    button.makeCornerRadius(radius: 12)
    button.setBorder(color: .base1, width: 1)
  }
}

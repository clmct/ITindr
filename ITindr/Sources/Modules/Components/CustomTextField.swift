import UIKit

final class CustomTextFiled: UIView {
  // MARK: - Properties
  
  let textField = UITextField()
  private let backgroundView = UIView()
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private Methods
  
  func setIsSecureTextEntry(_ isSecureTextEntry: Bool) {
    textField.isSecureTextEntry = isSecureTextEntry
  }
  
  func setAttributedPlaceholder(attributedString: NSAttributedString) {
    textField.attributedPlaceholder = attributedString
  }
  
  private func setup() {
    addSubview(backgroundView)
    backgroundView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.height.equalTo(56)
    }
    
    backgroundView.addSubview(textField)
    backgroundView.backgroundColor = .base2
    backgroundView.layer.cornerRadius = 28
    
    textField.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(24)
      make.centerY.equalToSuperview()
    }
  }
}

extension UITextField {
  
}

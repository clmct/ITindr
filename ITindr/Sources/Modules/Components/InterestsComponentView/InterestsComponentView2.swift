import UIKit
import TagListView

final class InterestsComponentView2: UIView {
  private let tagListView = TagListView()
  public var items: [String] = []
  
  init(items: [String]) {
    super.init(frame: .zero)
    self.items = items
    backgroundColor = .clear
    setup()
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure() {
    tagListView.addTags(items)
  }
  
  private func setup() {
    tagListView.delegate = self
    
    addSubview(tagListView)
    tagListView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
//    tagListView.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)

    tagListView.cornerRadius = 12
    tagListView.borderColor = .base1
    tagListView.borderWidth = 1
    tagListView
    
    tagListView.textFont = .regular14
    tagListView.textColor = .base1
    tagListView.backgroundColor = .base0

    
//    button.setTitleFont(.bold14)
//    button.setTitleColor(.base0)
//    button.backgroundColor = .base1
    
//  case false:
//    button.setTitleFont(.regular14)
//    button.setTitleColor(.base1)
//    button.backgroundColor = .base0
//  case true:
//    button.setTitleFont(.bold14)
//    button.setTitleColor(.base0)
//    button.backgroundColor = .base1
  }
}

extension InterestsComponentView2: TagListViewDelegate {
  
}

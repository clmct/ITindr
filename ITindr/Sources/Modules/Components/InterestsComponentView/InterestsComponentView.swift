import UIKit

final class InterestsComponentView: UIView {
  private lazy var leftAlignedCollectionViewFlowLayout = LeftAlignedCollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: .zero,
                                                     collectionViewLayout: leftAlignedCollectionViewFlowLayout)
  
  private let collectionViewDataSource = CollectionViewDataSource()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    collectionView.backgroundColor = .clear
    
    collectionView.delegate = collectionViewDataSource
    collectionView.dataSource = collectionViewDataSource
    collectionView.register(InterestCollectionViewCell.self,
                            forCellWithReuseIdentifier: InterestCollectionViewCell.identifier)
    collectionView.reloadData()
  }
  
}

final class CollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
  let items = ["Swift", "Python", "Objective c", "JS", "Javascript", "c++",
               "Javascript", "C", "Objective c", "Javascript", "Python", "Python",]
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestCollectionViewCell.identifier,
                                                        for: indexPath) as? InterestCollectionViewCell else {
              return UICollectionViewCell()
            }
    cell.configure(text: items[indexPath.row], isSelected: indexPath.row % 3 == 0)
    return cell
  }
}

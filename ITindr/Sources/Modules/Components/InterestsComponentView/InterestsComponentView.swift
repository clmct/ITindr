import UIKit

final class InterestsComponentView: UIView {
  private lazy var leftAlignedCollectionViewFlowLayout = LeftAlignedCollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: .zero,
                                                     collectionViewLayout: leftAlignedCollectionViewFlowLayout)
  
  private let collectionViewDataSource = InterestsCollectionViewDataSource()
  
  
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

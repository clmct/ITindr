import UIKit

protocol ChatViewModelProtocol {
  func viewWillAppear()
  func viewWillDisappear()
}

protocol ChatViewModelDelegate: AnyObject {
  func viewWillAppear()
  func viewWillDisappear()
}

final class ChatViewModel: ChatViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = Any
  
  // MARK: - Properties
  weak var delegate: ChatViewModelDelegate?
  private let dependencies: Dependencies
  private var id: String
  
  // MARK: - Init
  init(id: String,
       dependencies: Dependencies) {
    self.id = id
    self.dependencies = dependencies
  }
  
  // MARK: - Public Methods
  func viewWillAppear() {
    delegate?.viewWillAppear()
  }
  
  func viewWillDisappear() {
    delegate?.viewWillDisappear()
  }
  // MARK: - Actions
  
  // MARK: - Private Methods
}

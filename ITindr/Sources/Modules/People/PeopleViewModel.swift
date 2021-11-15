import Foundation

final class PeopleViewModel {
  // MARK: - Types
  typealias Dependencies = HasNetworkService
  
  // MARK: - Properties
  weak var delegate: ProfileViewModelDelegate?
  private let dependencies: Dependencies
  var onDidUpdate: VoidClosure?
  var people: Users = []
  
  
  // MARK: - Init
  init(dependencies: Dependencies) {
    self.dependencies = dependencies
  }
  
  // MARK: - Public Methods
  func getPeople() {
    dependencies.networkService.getUserList(limit: 40, offset: 20) { result in
      switch result {
      case .success(let response):
        self.people = response.filter { $0.name != "" }
        self.onDidUpdate?()
      case .failure(let error):
        print(error)
      }
    }
  }
  // MARK: - Actions
  
  // MARK: - Private Methods

}

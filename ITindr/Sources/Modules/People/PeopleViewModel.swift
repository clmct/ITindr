import Foundation

protocol PeopleViewModelDelegate: AnyObject {
  func peopleViewModelDidRequestShowAboutUser(_ viewModel: PeopleViewModel)
}

final class PeopleViewModel {
  // MARK: - Types
  typealias Dependencies = HasNetworkService & HasCoreDataService
  
  // MARK: - Properties
  weak var delegate: PeopleViewModelDelegate?
  private let dependencies: Dependencies
  var onDidUpdate: VoidClosure?
  var people: Users = []
  
  
  // MARK: - Init
  init(dependencies: Dependencies) {
    self.dependencies = dependencies
  }
  
  // MARK: - Public Methods
  func updatePeople() {
    dependencies.networkService.getUserList(limit: 40, offset: 20) { result in
      switch result {
      case .success(let response):
        let people = response.filter { $0.name != "" }
        self.dependencies.coreDataService.savePeople(with: people)
        self.getPeople()
        self.onDidUpdate?()
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func getPeople() {
    dependencies.coreDataService.getPeople { result in
      switch result {
      case .success(let users):
        self.people = users
        self.onDidUpdate?()
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func showAboutUser() {
    delegate?.peopleViewModelDidRequestShowAboutUser(self)
  }
  // MARK: - Actions
  
  // MARK: - Private Methods

}

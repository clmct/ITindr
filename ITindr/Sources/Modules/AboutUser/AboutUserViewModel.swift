import Foundation

final class AboutUserViewModel {
  // MARK: - Types
  typealias Dependencies = HasNetworkService & HasCoreDataService
  
  private let dependencies: Dependencies
  var onDidUpdate: VoidClosure?
  let id: String
  var profile: Profile? = nil
  
  // MARK: - Init
  init(dependencies: Dependencies, id: String) {
    self.dependencies = dependencies
    self.id = id
  }
  
  func getInfo() {
    dependencies.coreDataService.getUser(with: id) { result in
      switch result {
      case .success(let profile):
        self.profile = profile
        self.onDidUpdate?()
      default:
        break
      }
    }
  }
}

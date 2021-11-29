import Foundation

protocol HasNetworkService {
  var networkService: NetworkService { get }
}

protocol HasUserStorageService {
  var networkService: UserStorageService { get }
}

protocol HasCoreDataService {
  var coreDataService: CoreDataService { get }
}

final class AppDependency: HasNetworkService, HasCoreDataService {
  var networkService: NetworkService = NetworkService()
  var coreDataService: CoreDataService = CoreDataService()
}

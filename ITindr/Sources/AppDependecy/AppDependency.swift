import Foundation

protocol HasNetworkService {
  var networkService: NetworkService { get }
}

protocol HasUserStorageService {
  var networkService: UserStorageService { get }
}

final class AppDependency: HasNetworkService {
  var networkService: NetworkService = NetworkService()
}

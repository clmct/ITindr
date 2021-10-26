import Foundation

protocol HasNetworkService {
  var networkService: NetworkService { get }
}

final class AppDependency: HasNetworkService {
  var networkService: NetworkService = NetworkService()
}

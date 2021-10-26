import Foundation

extension NetworkService {
  func getTopic(completion: @escaping (Result<Topic, NetworkError>) -> Void) {
    let url = URLFactory.Topic.topic
    let token = ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .get,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Topic, NetworkError>) in completion(result) }
  }
}

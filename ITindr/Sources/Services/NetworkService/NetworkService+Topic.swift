import Foundation

extension NetworkService {
  func getTopic(completion: @escaping (Result<Topics, NetworkError>) -> Void) {
    let url = URLFactory.Topic.topic
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .get,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Topics, NetworkError>) in completion(result) }
  }
}

import Foundation

extension NetworkService {
  func login(email: String,
             password: String,
             completion: @escaping (Result<AuthResponse, NetworkError>) -> Void) {
    let url = URLFactory.Authentication.login
    let parameters = [
      "email" : email,
      "password" : password
    ]
    let request = createBaseRequest(url: url,
                                    method: .post,
                                    parameters: parameters)
    fetch(urlRequest: request) { (result: Result<AuthResponse, NetworkError>) in completion(result) }
  }
  
  func register(email: String,
                password: String,
                completion: @escaping (Result<AuthResponse, NetworkError>) -> Void) {
    let url = URLFactory.Authentication.register
    let parameters = [
      "email" : email,
      "password" : password
    ]
    let request = createBaseRequest(url: url,
                                    method: .post,
                                    parameters: parameters)
    fetch(urlRequest: request) { (result: Result<AuthResponse, NetworkError>) in completion(result) }
  }
  
  
  func logout(completion: @escaping (Result<AuthResponse, NetworkError>) -> Void) {
    let token = ""
    let url = URLFactory.Authentication.logout
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .delete,
                                    header: header)
    fetch(urlRequest: request) { (result: Result<AuthResponse, NetworkError>) in completion(result) }
  }
  
  func refresh(completion: @escaping (Result<AuthResponse, NetworkError>) -> Void) {
    let token = ""
    let url = URLFactory.Authentication.refresh
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .post,
                                    header: header)
    fetch(urlRequest: request) { (result: Result<AuthResponse, NetworkError>) in completion(result) }
  }
}

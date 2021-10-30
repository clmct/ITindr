import UIKit

enum HeaderKeys: String {
  case authorization = "Authorization"
  case bearer = "Bearer"
  case language = "Accept-Language"
}

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case delete = "DELETE"
  case patch = "PATCH"
}

enum NetworkError: Error {
  case url
  case data
  case response
  case json
}

protocol AuthEndpoints {
  func login()
}

final class NetworkService {
  public static var shared = NetworkService()
  
  func fetch<T: Codable>(urlRequest: URLRequest?, completion: @escaping (Result<T, NetworkError>) -> Void) {
    guard let urlRequest = urlRequest else {
      completion(.failure(.url))
      return
    }
    URLSession(configuration: .default).dataTask(with: urlRequest) { data, response, error in
      guard let data = data else {
        DispatchQueue.main.async {
          completion(.failure(.data))
        }
        return
      }
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let message = json["message"] as? String {
          print(message)
        }
        DispatchQueue.main.async {
          completion(.failure(.response))
        }
        return
      }
      do {
        let jsonObject = try JSONDecoder().decode(T.self, from: data)
        DispatchQueue.main.async {
          completion(.success(jsonObject))
        }
      } catch {
        DispatchQueue.main.async {
          completion(.failure(.json))
        }
      }
    }.resume()
  }
  
  func createBaseRequest(url: String,
                         query: [String: String?] = [:],
                         method: HTTPMethod,
                         parameters: [String: Any] = [:],
                         header: [HeaderKeys: String] = [:]) -> URLRequest? {
    guard var urlBuilder = URLComponents(string: url) else { return nil }
    
    urlBuilder.queryItems = query.map { (key: String, value: String?) in
      return URLQueryItem(name: key, value: value)
    }
    
    guard let url = urlBuilder.url else { return nil }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    for (key, value) in header {
      urlRequest.setValue(value, forHTTPHeaderField: key.rawValue)
    }
    
    let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
    urlRequest.httpBody = httpBody
    dump(urlRequest)
    return urlRequest
  }
  
  func createUploadRequest(url: String,
                           query: [String: String?] = [:],
                           method: HTTPMethod,
                           image: UIImage,
                           header: [HeaderKeys: String] = [:]) -> URLRequest? {
    guard var urlBuilder = URLComponents(string: url) else { return nil }
    
    urlBuilder.queryItems = query.map { (key: String, value: String?) in
      return URLQueryItem(name: key, value: value)
    }
    
    guard let url = urlBuilder.url else { return nil }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    
    let boundary = "123456434523432"
    urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    var data = Data()
    data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
    data.append("Content-Disposition: form-data; name=\"\("name")\"; filename=\"\("fileName")\"\r\n".data(using: .utf8)!)
    data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
    data.append(image.pngData()!)
    data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
    
    urlRequest.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
    
    
    for (key, value) in header {
      urlRequest.setValue(key.rawValue, forHTTPHeaderField: value)
    }
    
    urlRequest.httpBody = data
    return urlRequest
  }
}

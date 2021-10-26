import Foundation

struct AuthResponse: Codable {
  var accessToken: String
  var refreshToken: String
}

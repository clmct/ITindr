import Foundation

// MARK: - Profile
struct Profile: Codable {
    let userID, name: String
    let aboutMyself, avatar: String?
    let topics: [Topic]
}

// MARK: - Topic
struct Topic: Codable {
    let id, title: String
}

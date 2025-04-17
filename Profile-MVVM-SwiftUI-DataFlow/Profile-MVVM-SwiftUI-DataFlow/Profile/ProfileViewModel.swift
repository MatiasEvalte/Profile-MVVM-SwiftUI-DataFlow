import Foundation

// MARK: - ProfileViewModel

class ProfileViewModel: ObservableObject {
  @Published var isFollow: Bool = false
  
  @Published var user = User(name: "Matias Evalte",
                             nickName: "evalteMatias",
                             followers: 2000,
                             buttonTitleFollow: "Seguir",
                             buttonUnfollow: "Deixar de seguir")
  
  func countFollowers() -> Int {
    return 2000
  }
}

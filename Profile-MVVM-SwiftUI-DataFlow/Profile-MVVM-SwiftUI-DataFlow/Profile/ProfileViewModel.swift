import Foundation

// MARK: - ProfileViewModel

class ProfileViewModel: ObservableObject {
  @Published var isFollow: Bool = false
  @Published var userFollowers: String = String()
  @Published var profile = Profile(name: "Matias Evalte",
                                   nickName: "evalteMatias",
                                   followers: 2000,
                                   buttonTitleFollow: "Seguir",
                                   buttonTitleUnfollow: "Deixar de seguir")
  
  init() {
    makeUserFollowers()
  }
  
  func countFollowers() {
    isFollow.toggle()
    isFollow ? (profile.followers += 1) : (profile.followers -= 1)
    makeUserFollowers()
  }
  
  func makeUserFollowers() {
    userFollowers = customizeNumber(value: profile.followers)
  }
  
  func customizeNumber(value: Int) -> String {
    let formatter = NumberFormatter ()
    formatter.numberStyle = .decimal
    formatter.locale = Locale(identifier: "pt_BR")
    let shorten = formatter.string (for: value) ?? "0"
    return "\(shorten) k"
  }
}

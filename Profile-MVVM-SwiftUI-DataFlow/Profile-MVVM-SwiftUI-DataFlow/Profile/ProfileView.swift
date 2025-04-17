import SwiftUI

private enum Constants {
  static var width: CGFloat = 250
  static var height: CGFloat = 250
  static var cornerRadius: CGFloat = 125
}

struct ProfileView: View {
  @EnvironmentObject var viewModel: ProfileViewModel
  
  var body: some View {
    VStack {
      HeaderView()
      ButtonsView()
    }
  }
}

// MARK: - HeaderView

struct HeaderView: View {
  @EnvironmentObject var viewModel: ProfileViewModel
  
  var body: some View {
    VStack {
      Image("Profile")
        .resizable()
        .frame(width: Constants.width,
               height: Constants.height)
        .cornerRadius( Constants.cornerRadius)
        .padding(.bottom, 10)
      
      Text(viewModel.profile.name)
        .font(.system(size: 50,
                      weight: .bold))
      
      Text(viewModel.profile.nickName)
        .font(.system(size: 25, weight: .regular))
        .foregroundColor(.gray)
      
      Text(viewModel.userFollowers)
        .font(.system(size: 80 , weight: .light))
        .padding(40)
    }
    .padding()
  }
}

// MARK: - ButtonsView

struct ButtonsView: View {
  @EnvironmentObject var viewModel: ProfileViewModel
  
  var body: some View {
    VStack {
      Button {
        viewModel.countFollowers()
      } label: {
        Label(viewModel.profile.buttonTitleFollow, systemImage: "")
          .font(.title3)
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      .controlSize(.large)
      .disabled(viewModel.isFollow)
      
      Button {
        viewModel.countFollowers()
      } label: {
        Label(viewModel.profile.buttonTitleUnfollow, systemImage: "")
          .font(.title3)
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      .controlSize(.large)
      .disabled(!viewModel.isFollow)
    }
    .padding()
    .animation(.easeInOut, value: viewModel.isFollow)
  }
}

#Preview {
  ProfileView()
    .environmentObject(ProfileViewModel())
}

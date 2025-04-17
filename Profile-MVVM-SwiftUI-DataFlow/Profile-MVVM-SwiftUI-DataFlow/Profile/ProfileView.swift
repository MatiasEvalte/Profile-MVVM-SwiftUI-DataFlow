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
      
      Text("Matias Evalte")
        .font(.system(size: 50,
                      weight: .bold))
      
      Text("@evalteMatias")
        .font(.system(size: 25, weight: .regular))
        .foregroundColor(.gray)
      
      Text("2.000")
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
        viewModel.isFollow = true
      } label: {
        Label("Seguir", systemImage: "")
          .font(.title3)
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      .controlSize(.large)
      .disabled(viewModel.isFollow)
      
      Button {
        viewModel.isFollow = false
      } label: {
        Label("Deixar de seguir", systemImage: "")
          .font(.title3)
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      .controlSize(.large)
      .disabled(!viewModel.isFollow)
    }
    .padding()
  }
}

#Preview {
  ProfileView()
    .environmentObject(ProfileViewModel())
}

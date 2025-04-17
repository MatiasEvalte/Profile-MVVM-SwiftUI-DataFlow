
import SwiftUI

struct ProfileView: View {
  var body: some View {
    VStack {
      HeaderView()
      ButtonsView()
    }
    .padding()
  }
}

// MARK: - HeaderView

struct HeaderView: View {
  enum Constants {
    static let width: CGFloat = 250
    static let height: CGFloat = 250
    static let cornerRadius: CGFloat = 125
  }
  
  var body: some View {
    VStack {
      Image("Profile")
        .resizable()
        .frame(width: Constants.width,
               height: Constants.height)
        .cornerRadius(Constants.cornerRadius)
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
  }
}

// MARK: - ButtonsView

struct ButtonsView: View {
  @State var isFollow: Bool = false
  
  var body: some View {
    VStack {
      Button {
        isFollow = true
      } label: {
        Label("Seguir", systemImage: "")
          .font(.title3)
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      .controlSize(.large)
      .disabled(isFollow)
      
      Button {
        isFollow = false
      } label: {
        Label("Deixar de seguir", systemImage: "")
          .font(.title3)
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      .controlSize(.large)
      .disabled(!isFollow)
    }
  }
}

#Preview {
  ProfileView()
}

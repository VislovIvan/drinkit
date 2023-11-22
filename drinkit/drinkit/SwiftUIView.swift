import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        GroupBox {
            VStack {
                HStack {
                    Text("Your account")
                        .font(.headline)
                    Spacer()
                    HStack {
                        Text("Your account")
                            .font(.headline)
                        Text("24")
                    }
                }
                HStack {
                    Text("Your account")
                        .font(.headline)
                    Spacer()
                    HStack {
                        Text("Your account")
                            .font(.headline)
                        Text("24")
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    SwiftUIView()
}

import SwiftUI

struct EveningOfferView: View {
    var body: some View {
        ZStack {
            Color.clear
            VStack {
                Spacer()
                HStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.blue)
                        .frame(width: 180, height: 200)
                    Rectangle()
                        .fill()
                        .foregroundColor(.blue)
                        .frame(width: 180, height: 200)
                }
            }
            .padding(.bottom, -180)
        }
    }
}

#Preview {
    EveningOfferView()
}

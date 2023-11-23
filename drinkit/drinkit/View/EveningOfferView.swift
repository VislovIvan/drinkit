import SwiftUI

struct EveningOfferView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("evening offer")
                .font(.custom("Montserrat-SemiBold", size: 22))
                .foregroundStyle(.white)

            HStack(spacing: 20) {
                BeverageOption(name: "Сocoa", price: "1.7 €", image: "image2")
                BeverageOption(name: "Matcha Latte", price: "1.9 € ", image: "image1")
            }
        }
    }
}

struct BeverageOption: View {
    var name: String
    var price: String
    var image: String

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.3)
                .padding(.top, 20)
            VStack(alignment: .leading, spacing: 25) {
                Text(name)
                    .font(.custom("Montserrat-Medium", size: 18))
                    .padding(.top, 5)
                
                Text(price)
                    .font(.custom("Montserrat-Medium", size: 20))
                    .padding(.top, 1)
            }
            .foregroundColor(.white)
            .padding(.leading, 15)
            Spacer()
        }
        .frame(width: 170, height: 270)
        .background(Color(#colorLiteral(red: 0.4230390787, green: 0.4032443762, blue: 0.3819832504, alpha: 0.72)))
        .cornerRadius(35)
    }
}

#Preview {
    EveningOfferView()
}

import SwiftUI

struct DrinkView: View {
    
    var drink: Drink
    
    @State private var dragAmount = CGSize.zero
    @State private var scale = 1.25
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            ZStack {
                Image(drink.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: blurRadius(for: dragAmount.height))
                    .scaleEffect(scale)
                    .overlay(Color.black.opacity(darknessOpacity(for: dragAmount.height)))
                    .edgesIgnoringSafeArea(.all)
                    .clipped()
                VStack(alignment: .leading) {
                    Spacer()
                    Text(drink.name)
                        .font(DesignSystem.Fonts.montserratMedium(size: 26))
                        .foregroundColor(.black)
                    
                    HStack(spacing: 20) {
                        priceButton
                        tasteButton
                    }
                }
                .padding(.horizontal, 15)
                .foregroundColor(.white)
                .padding(.bottom, 140)
                .blur(radius: blurRadius(for: dragAmount.height))
                
                EveningOfferView()
                    .offset(y: dragAmount.height)
                    .offset(y: UIScreen.main.bounds.height / 2 + 40)
                
                if isLoading {
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                            .zIndex(1)
                            .padding(.top, 100)
                        Spacer()
                    }
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.dragAmount = gesture.translation
                        self.updateScale()
                        self.updateLoadingIndicator()
                        
                        // degub
                        print("Start Y: \(self.dragAmount.height)")
                    }
                    .onEnded { _ in
                        if self.dragAmount.height < -90 {
                            self.dragAmount.height = -290
                        } else {
                            self.dragAmount = .zero
                        }
                        self.updateScale()
                        self.updateLoadingIndicator()
                        
                        // degub
                        print("End Y: \(self.dragAmount.height)")
                    }
            )
            .animation(.spring(duration: 0.4), value: dragAmount.height)
        }
    }
    
    private var priceButton: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1983636618, green: 0.2968104184, blue: 0.8592069745, alpha: 0.7975393282)), Color(#colorLiteral(red: 0.1983636618, green: 0.2968104184, blue: 0.8592069745, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing))
                .frame(height: 58)
                .cornerRadius(30)
            HStack {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .bold()
                Text("\(drink.price, specifier: "%.2f") €")
                    .font(DesignSystem.Fonts.montserratMedium(size: 24))
            }
        }
    }
    
    private var tasteButton: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6680647731, green: 0.2601701021, blue: 0.5787851214, alpha: 1)), Color(#colorLiteral(red: 0.9017934203, green: 0.4886869788, blue: 0.4330995083, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing))
                .frame(height: 58)
                .cornerRadius(30)
            HStack {
                Image(systemName: "wand.and.stars")
                    .font(.system(size: 22))
                    .bold()
                Text("taste")
                    .font(DesignSystem.Fonts.montserratMedium(size: 20))
            }
        }
    }
    
    private func darknessOpacity(for dragHeight: CGFloat) -> CGFloat {
        let maxOpacity: CGFloat = 0.5
        if dragHeight < 0 {
            let opacity = abs(dragHeight / 90) * maxOpacity
            return min(opacity, maxOpacity)
        } else {
            return 0
        }
    }
    
    private func blurRadius(for dragHeight: CGFloat) -> CGFloat {
        let maxBlur: CGFloat = 20
        if dragHeight < 0 {
            let blur = abs(dragHeight / 90) * maxBlur
            return min(blur, maxBlur)
        } else {
            return 0
        }
    }
    
    private func updateScale() {
        if dragAmount.height < 0 {
            scale = max(1.18, 1.25 + dragAmount.height / 1000)
        } else {
            scale = 1.25 + dragAmount.height / 3000
        }
    }
    
    private func updateLoadingIndicator() {
        isLoading = dragAmount.height > 50
    }
    
}

#Preview {
    DrinkView(drink:  Drink(name: "Какао", imageName: "bg_image1", price: 1.7))
}

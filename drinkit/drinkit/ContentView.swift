import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    @State private var scale = 1.1 // Начальный масштаб установлен на 110%
    @State private var isLoading = false // Состояние для индикатора загрузки

    var body: some View {
        VStack {
            ZStack {
                Image("testImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: blurRadius(for: dragAmount.height))
                    .scaleEffect(scale)
                    .edgesIgnoringSafeArea(.all)
                EveningOfferView()
                    .offset(y: dragAmount.height)

                if isLoading {
                    VStack {
                        ProgressView() // Индикатор загрузки
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                            .zIndex(1) // Повышение z-индекса, чтобы быть над всеми другими элементами
                            .padding(.top, 50)
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
                        print("Перетаскивание изменено, Y: \(self.dragAmount.height)")
                    }
                    .onEnded { _ in
                        if self.dragAmount.height < -90 {
                            // "Магнитим" к отступу 90
                            self.dragAmount.height = -290
                        } else {
                            self.dragAmount = .zero
                        }
                        self.updateScale()
                        self.updateLoadingIndicator()
                        print("Перетаскивание завершено, Y: \(self.dragAmount.height)")
                    }
            )
            .animation(.spring(duration: 0.4), value: dragAmount.height)
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
            // Уменьшение размера при скролле снизу вверх, минимальный масштаб - 1.0
            scale = max(1.0, 1.1 + dragAmount.height / 1000)
        } else {
            // Увеличение размера при скролле сверху вниз, начиная с 1.1
            scale = 1.1 + dragAmount.height / 3000
        }
    }

    private func updateLoadingIndicator() {
        // Показывать индикатор загрузки, когда Y > 50
        isLoading = dragAmount.height > 50
    }
}

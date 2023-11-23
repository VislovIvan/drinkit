import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = DrinksViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(viewModel.drinks, id: \.name) { drink in
                    DrinkView(drink: drink)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}

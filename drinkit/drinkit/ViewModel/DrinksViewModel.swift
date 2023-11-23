import SwiftUI

class DrinksViewModel: ObservableObject {
    @Published var drinks: [Drink] = []

    init() {
        loadDrinks()
    }

    private func loadDrinks() {
        drinks = [
            Drink(name: "Какао", imageName: "bg_image1", price: 1.7),
            Drink(name: "Фильтр-Эфиопия", imageName: "bg_image2", price: 2.0),
            Drink(name: "Матча латте", imageName: "bg_image3", price: 2.2),
            Drink(name: "Какао Айс", imageName: "bg_image4", price: 2.1)
        ]
    }
}


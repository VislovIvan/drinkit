import SwiftUI

class DrinksViewModel: ObservableObject {
    @Published var drinks: [Drink] = []

    init() {
        loadDrinks()
    }

    private func loadDrinks() {
        drinks = [
            Drink(name: "Cocoa", imageName: "Cocoa", price: 1.7),
            Drink(name: "Filter Coffee", imageName: "Filter Coffee", price: 2.0),
            Drink(name: "Matcha", imageName: "Matcha", price: 2.2),
            Drink(name: "Cocoa Ice", imageName: "Cocoa Ice", price: 2.1)
        ]
    }
}


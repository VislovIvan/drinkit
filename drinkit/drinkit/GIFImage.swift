import SwiftUI
import UIKit

struct AnimatedImageView: UIViewRepresentable {
    var imageName: String

    func makeUIView(context: Context) -> UIImageView {
        guard let gifImage = UIImage.gif(name: imageName) else {
            return UIImageView()
        }

        let imageView = UIImageView(image: gifImage)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        // Здесь можно обновить представление, если потребуется
    }
}

extension UIImage {
    // Функция для загрузки GIF из Assets
    static func gif(name: String) -> UIImage? {
        guard let path = Bundle.main.path(forResource: name, ofType: "gif"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let gif = UIImage.gif(data: data) else {
            return nil
        }
        return gif
    }

    static func gif(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }

        var images = [UIImage]()
        let count = CGImageSourceGetCount(source)

        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage))
            }
        }

        return UIImage.animatedImage(with: images, duration: Double(count) / 10.0)
    }
}

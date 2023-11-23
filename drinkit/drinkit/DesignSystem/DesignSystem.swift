import SwiftUI

// TODO: Complete the DesignSystem
struct DesignSystem {
    struct Colors {
        static let primaryColor = Color(#colorLiteral(red: 0.1983636618, green: 0.2968104184, blue: 0.8592069745, alpha: 1))
    }
    
    struct Fonts {
        static func montserratMedium(size: CGFloat) -> Font {
            Font.custom("Montserrat-Medium", size: size)
        }
        static func montserratRegular(size: CGFloat) -> Font {
            Font.custom("Montserrat-Regular", size: size)
        }
        static func montserratSemiBold(size: CGFloat) -> Font {
            Font.custom("Montserrat-SemiBold", size: size)
        }
    }
    
}

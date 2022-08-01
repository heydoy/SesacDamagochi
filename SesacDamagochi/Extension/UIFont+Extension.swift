//
//  UIFont+Extension.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/31.
//

import Foundation
import UIKit

extension UIFont {
    enum SCoreDream {
        case extralight
        case medium
        case bold
        
        func getString() -> String {
            switch self {
            case .extralight : return "S-CoreDream-2ExtraLight"
            case .medium : return "S-CoreDream-5Medium"
            case .bold : return "S-CoreDream-8Heavy"
            }
        }
    }
    static func customFont(size: CGFloat, family: SCoreDream = .medium ) -> UIFont {
        return UIFont(name: family.getString(), size: size)!
        
    }
}

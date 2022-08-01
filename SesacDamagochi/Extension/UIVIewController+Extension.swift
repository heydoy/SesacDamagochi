//
//  UIVIewController+Extension.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/08/01.
//

import Foundation
import UIKit


extension UIViewController {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

//
//  UITextField+Extension.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/24.
//

import UIKit

extension UITextField {
    func addOnlyBottomBorder() {
        let bottomBorder = CALayer()
        
        // 보더는 텍스트필드 프레임 안에 있어야 하므로 Y는 프레임의 높이-1
        bottomBorder.frame = CGRect(x: 0,
                                    y: frame.size.height-1,
                                    width: frame.size.width,
                                    height: 1)
        bottomBorder.backgroundColor = UIColor.DamagochiFontAndBorderColor.cgColor
        borderStyle = .none
        layer.addSublayer(bottomBorder)
        
        // 보더가 텍스트필드 영역을 넘어가지 않도록 설정
        layer.masksToBounds = true
    }
}

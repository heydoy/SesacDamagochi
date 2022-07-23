//
//  Damagochi.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/23.
//

import UIKit

struct Damagochi {
    let id: Int // 다마고치 아이디는 1,2,3, 없는 애들은 다른 숫자로
    let name: String
    let overview: String
    
    
    var rice: Int
    var water: Int
    
    var level: Int {
        let value = Int((rice/5)+(water/2))
        if value <= 1 {
            return 1
        } else if value > 1 && value < 10 {
            return value
        } else {
            return 10
        }
    }
    
    var image: String {
        if (1...3).contains(id) { // id가 1,2,3일때 : 있는 다마고치일때
            switch level {
            case 0,1 : return "\(id)-1"
            case 2...9 : return "\(id)-\(level)"
            case 10 : return "\(id)-9"
            default : return "\(id)-9"
            }
        
        } else {
            return "noImage"
        }
    
    }
}



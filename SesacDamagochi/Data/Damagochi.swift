//
//  Damagochi.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/23.
//

import UIKit

// 다마고치 공통 구조체
struct Damagochi: Codable {
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
    var thumnailImage: String {
        if (1...3).contains(id) {
            return "\(id)-9"
        } else {
            return "noImage"
        }
    }
}

// 다마고치 모음
struct Damagochis: Codable {
    var items: [Damagochi] = [
        Damagochi(
            id: 1,
            name: "따끔따끔 다마고치",
            overview: "저는 선인장 다마고치에요. 키는 150cm, 몸무게는 30kg 이에요. 외강내유에요. 열심히 잘 자라보겟습니다. 주인님!",
            rice: 0,
            water: 0),
        Damagochi(
            id: 2,
            name: "방실방실 다마고치",
            overview: "저는 햇님 다마고치에요. 키는 300cm, 몸무게는 130kg 이에요. 외강내유에요. 열심히 잘 자라보겟습니다. 주인님!",
            rice: 0,
            water: 0),
        Damagochi(
            id: 3,
            name: "반짝반짝 다마고치",
            overview: "저는 별님 다마고치에요. 키는 120cm, 몸무게는 40kg 이에요. 외강내유에요. 열심히 잘 자라보겟습니다. 주인님!",
            rice: 0,
            water: 0),
        Damagochi(
            id: 4,
            name: "준비중이에요",
            overview: "",
            rice: 0,
            water: 0)
    ]
}

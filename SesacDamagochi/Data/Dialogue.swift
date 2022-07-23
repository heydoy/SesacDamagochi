//
//  Dialogue.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/23.
//

/*
   프로그래밍 명언 API를 받아와서 할 예정
   링크 : https://programming-quotes-api.herokuapp.com/quotes
*/

struct Dialogues: Codable {
    struct Dialogue: Codable {
        let id: String
        let author: String
        let en: String
    }
    
    let dialogue: [Dialogue]
}

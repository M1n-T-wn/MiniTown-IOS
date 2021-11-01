//
//  MypageModel.swift.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/30.
//

import Foundation

struct myPage : Codable {
    let count : Int
    let data : MainData
    
}
struct MainData : Codable {
    let name : String
    let id : String
    let profile : URL
    let birth : String
    let gender : String
    let info : String?
    
}

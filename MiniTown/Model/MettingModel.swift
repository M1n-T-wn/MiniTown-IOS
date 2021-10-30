//
//  MettingModel.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/30.
//

import Foundation

struct mettingSucces : Codable {
    let count : Int
    var data : mettingcontent
}
struct  mettingcontent : Codable {
    var content : [ChattingRoom]
   
}
struct ChattingRoom : Codable {
    let identifyId : Int?
    let id : String
    let name : String
    let type : String
  
    let Image : String?
    let admin : String
    let info : String
    let category : String
    let members : String?
    let createAt : String?
    let onOffline : String

    let chatCount : Int
    let applicants : [String]
}

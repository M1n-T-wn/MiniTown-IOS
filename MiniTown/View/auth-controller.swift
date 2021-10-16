//
//  auth-controller.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import Foundation

struct LocalLoginDto : Codable{
    let id : String
    let password : String
}

struct LocalSignUpDto : Codable{
    let id : String
    let name : String
    let password : String
}


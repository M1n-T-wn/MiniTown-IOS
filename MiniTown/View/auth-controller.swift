//
//  auth-controller.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import Foundation

var LoginDone = true
var signupDone = true

struct LocalLoginDto : Codable {
    let id : String
    let password : String
}

struct LocalSignUpDto : Codable {
    let id : String
    let name : String
    let password : String
}

struct Success : Codable {
    let count : Int
    let data : String 
}

struct LoginSuccess : Codable {
    let count : Int
    let data : JwtTokenResponse?
}

//
//  Token.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import Foundation

struct JwtTokenResponse : Codable{
    let accessToken  :  String
    let refreshToken  :  String
}

struct Token {
    static var accessToken: String? {
        get {
            return UserDefaults.standard.string(forKey: "accessToken")
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: "accessToken")
        }
    }
    
    static var refreshToken: String?{
        get {
            return UserDefaults.standard.string(forKey: "refreshToken")
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: "refreshToken")
        }
    }
}

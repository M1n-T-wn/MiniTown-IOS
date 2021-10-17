//
//  File.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import Foundation
import Alamofire

let baseURL = "http://13.125.0.94:9093"

enum Api {
    case login(_ id : String, _ password : String)
    case reissue(_ accessToken : String, _ refreshToken : String)
    case signup(_ id : String, _ name : String, _ password : String)
    
    func path() -> String {
        switch self {
        case .signup:
            return "/api/auth/signup"
        case .login:
            return "/api/auth/login"
        case .reissue:
            return "/api/auth/reissue"
        }
    }
    func method() -> HTTPMethod {
        switch self {
        case .login:
            return .post
        case .reissue:
            return .post
        case .signup:
            return .post
        }
    }
    
}


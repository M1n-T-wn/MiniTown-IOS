//
//  File.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import Foundation
import Alamofire

let baseURL = "http://54.180.98.98:9094"

enum Api {
    case login(_ id : String, _ password : String)
    case reissue(_ accessToken : String, _ refreshToken : String)
    case signup(_ birth : String, _ gender : String, _ id : String, _ loginType : String, _ name : String, _ password : String, _ phone : String)
    case check(_ checkId : String)
    case phoneCheck(_ checkPhone : String)
    // Soket
    
    case creatChatroom
    case joinChatroom(_ chatId : Int64)
    case resignChatroom(_ chatId : Int64)
    case sendChatroom(_ chatId : Int64)
    case removeChatroom(_ chatId : Int64)

    func path() -> String {
        switch self {
        case .signup:
            return "/api/auth/signup"
        case .login:
            return "/api/auth/login"
        case .reissue:
            return "/api/auth/reissue"
        case .creatChatroom:
            return "/websocket/create/chatroom"
        case .joinChatroom(_):
            return "/websocket//join/chatroom/{"
        case .resignChatroom(_):
            // /websocket/resign/chatroom/{chatRoomId}
            return "/websocket/resign/chatroom/{"
        case .sendChatroom(_):
            // /websocket/chat/{chatRoomId}/send
            // chatRoomId}/send
            return "/websocket/chat/{"
        case .removeChatroom(_):
            return "/websocket/chat/remove/{"
        case .check(_):
            return "/api/auth/check"
        case .phoneCheck(_):
            return "/api/auth/phone"
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
        case .creatChatroom:
            return .get
        case .joinChatroom(_):
            return .get
        case .resignChatroom(_):
            return .get
        case .sendChatroom(_):
            return .get
        case .removeChatroom(_):
            return .get
        case .check(_):
            return .post
        case .phoneCheck(_):
            return .post
        }
    }
    
}


//
//  Requst.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import Foundation
import Alamofire
import UIKit

let decoder = JSONDecoder()

func logindata(id : String, password : String){
    AF.request(baseURL + Api.login(id, password).path() ,
               method: Api.login(id, password).method(),
               parameters: ["id" : id, "password" : password],
               encoder: JSONParameterEncoder.default)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            print("Json : \n\(response)")
            switch response.result {
            case .success:
                print("POST 성공")
                
                guard let data = response.data else { return }
                do {
                    let resault = try decoder.decode(LoginSuccess.self, from: data)
                    print(resault)
                    Token.accessToken = resault.data?.accessToken
                    Token.refreshToken = resault.data?.refreshToken
                    print(resault as Any)
                    print("----------111")
                    print("accessToken : \(String(describing: Token.accessToken))\n refreshToken : \(String(describing: Token.refreshToken))")
                    print("-=-=-=-\(LoginDone) ??")
                }
                catch {
                    print(error)
                }
            case .failure(let error):
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
                print("-=-=-=-\(LoginDone) 11?")
                LoginDone = false
            }
        }
}
func DuplicateIdData(id : String){
    AF.request(baseURL + Api.check(id).path() + "?id=" + id,
               method: Api.check(id).method())
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            print(response)
            switch response.result {
            case .success :
                print("POST 성공, 아이디 정보")
                guard let data = response.data else { return }
                if let resault = try? decoder.decode(LoginSuccess2.self, from: data) {
                    print(resault)
                    checkId = resault.data
                    info.checkPhone = checkId
                }
                
            case .failure(let error):
                signupDone = false
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}
func DuplicatePhoneIdData(phone : String, check : String) {
    AF.request("http://54.180.98.98:9094/api/auth/phone/" + phone + "?rand=" + check,
               method: Api.phoneCheck(phone).method())
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            print(response)
            switch response.result {
            case .success :
                print("http://54.180.98.98:9094/api/auth/phone/" + phone + "?rand=" + check)
            case .failure(let error):
                checkPhoneDone = false
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}

func ConfirmationData(phone : String) {
    AF.request(baseURL + Api.phoneCheck(phone).path(),
               method: Api.phoneCheck(phone).method(),
               parameters: ["phone": phone],
               encoder: JSONParameterEncoder.default)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            print(response)
            switch response.result {
            case .success :
                print("POST 성공, Phone : \(phone) ")
                guard let data = response.data else { return }
                if let resault = try? decoder.decode(LoginSuccess2.self, from: data) {
                    print(resault)
                    info.checkPhone = resault.data
                }
                
            case .failure(let error):
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}
func signupdata(birth : String, gender : String,  id : String, loginType : String, name : String, password : String, phone : String){
    AF.request(baseURL + Api.signup(birth, gender, id, loginType, name, password, phone).path() + "?rand=" + "\(info.checkPhone!)",
               method: Api.signup(birth, gender, id, loginType, name, password, phone).method(),
               parameters: ["birth": birth, "gender": gender,
                            "id" : id, "name" : name,
                            "password" : password,  "phone": phone,
                            "address" : info.jibunAddress, "addressCode" : info.zoneCode,
                            "detailAddress" : info.detailAddress, "keyAddress" : info.keyadress],
               encoder: JSONParameterEncoder.default)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            
            print(response)
            switch response.result {
            case .success:
                print("POST 성공")
                guard let data = response.data else { return }
                do {
                    let resault = try decoder.decode(LoginSuccess.self, from: data)
                    print(resault)
                    Token.accessToken = resault.data?.accessToken
                    Token.refreshToken = resault.data?.refreshToken
                    print(resault as Any)
                    print("----------")
                    print("accessToken : \(String(describing: Token.accessToken))\n refreshToken : \(String(describing: Token.refreshToken))")
                }
                catch {
                    print(error)
                }
            case .failure(let error):
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}

func TokenReissue() {
    AF.request(baseURL + Api.reissue(Token.accessToken!, Token.refreshToken!).path(),
               method: Api.reissue(Token.accessToken!, Token.refreshToken!).method(),
               parameters: ["accessToken" : Token.accessToken, "refreshToken" : Token.refreshToken],
               encoder: JSONParameterEncoder.default)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            print(response)
            switch response.result {
            case .success:
                print("POST 성공")
                guard let data = response.data else { return }
                do {
                    let resault = try decoder.decode(LoginSuccess.self, from: data)
                    print(resault)
                    Token.accessToken = resault.data?.accessToken
                    Token.refreshToken = resault.data?.refreshToken
                    print(resault as Any)
                    print("-----reissue-----")
                    print("accessToken : \(String(describing: Token.accessToken))\n refreshToken : \(String(describing: Token.refreshToken))")
                    
                }
                catch {
                    print(error)
                }
            case .failure(let error):
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}

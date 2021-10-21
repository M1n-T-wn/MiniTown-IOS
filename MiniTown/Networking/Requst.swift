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
            print(response)
            switch response.result {
            case .success:
                print("POST 성공")
               
                guard let data = response.data else { return }
                do {
                    if let resault = try? decoder.decode(LoginSuccess.self, from: data) {
                        if resault.data == nil {
                            print("login error!!")
                            LoginDone = false
                            print("----------\(LoginDone)----------")
                            break
                        } else {
                            LoginDone = true
                        }
                        
                        Token.accessToken = resault.data?.accessToken
                        Token.refreshToken = resault.data?.refreshToken
                        print(resault)
                        print("----------")
                        print("accessToken : \(String(describing: Token.accessToken))\n refreshToken : \(String(describing: Token.refreshToken))")
                    }
                }
            case .failure(let error):
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}
func DuplicateIdData(id : String){
    AF.request(baseURL + Api.check(id).path(),
               method: Api.check(id).method(),
               parameters: id,
               encoder: JSONParameterEncoder.default)
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
                    
                }
                
            case .failure(let error):
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}

func ConfirmationData(phone : String) {
    AF.request(baseURL + Api.phoneCheck(phone).path(),
               method: Api.phoneCheck(phone).method(),
               parameters: Int(phone),
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
                    checkPhoneD = resault.data
                }
                
            case .failure(let error):
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}
func signupdata(birth : String, gender : String,  id : String, loginType : String, name : String, password : String, phone : String){
    AF.request(baseURL + Api.signup(birth, gender, id, loginType, name, password, phone).path(),
               method: Api.signup(birth, gender, id, loginType, name, password, phone).method(),
               parameters: ["birth": birth, "gender": gender, "id" : id, "loginType": loginType, "name" : name, "password" : password,  "phone": phone],
               encoder: JSONParameterEncoder.default)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            
            print(response)
            switch response.result {
            case .success:
                print("POST 성공")
                let decoder = JSONDecoder()
                guard let data = response.data else { return }
                do {
                    let resault = try decoder.decode(Success.self, from: data)
                    if resault.data != "success" {
                    }
                    print(resault)
                    
                }
                catch {
                    print(error)
                }
            case .failure(let error):
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}


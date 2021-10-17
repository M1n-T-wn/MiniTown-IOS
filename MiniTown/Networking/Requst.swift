//
//  Requst.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/16.
//

import Foundation
import Alamofire
import UIKit

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
                let decoder = JSONDecoder()
                guard let data = response.data else { return }
                do {
                    if let resault = try? decoder.decode(LoginSuccess.self, from: data) {
                        if resault.data == nil {
                            print("")
                            LoginDone = false
                            break
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

func signupdata(id : String, name : String, password : String){
    AF.request(baseURL + Api.signup(id, name, password).path() ,
               method: Api.signup(id, name, password).method(),
               parameters: ["id" : id, "name" : name, "password" : password],
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


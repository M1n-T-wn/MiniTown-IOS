//
//  MettingRequst.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/30.
//

import Alamofire
import Foundation

let headers : HTTPHeaders = ["Authorization" : "Bearer \(Token.accessToken!)"]

// http://5197-211-36-140-184.ngrok.io
// baseURL + "/api/meetings/10

func mettingModelParse()  {
    AF.request(baseURL + "/api/meetings/10", method: .get,  headers: headers)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let resault = try decoder.decode(mettingSucces.self, from: data)
                    print(resault)
                    MainCount = resault.data.content.count
                    print("-=-=-=-=-=--=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-")
                    print(resault.data.content.count)
                    chattingRoom = resault.data.content
                }
                catch {
                    
                    print(error)
                }
            case .failure(let error):
                
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }

    
}

//
//  MypageRequst.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/30.
//

import Foundation
import Alamofire

func myPageData() {
//http://54.180.98.98:9094/api/mypage
    AF.request(baseURL + "/api/mypage", method: .get,  headers: headers)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let resault = try decoder.decode(myPage.self, from: data)
                    
                }
                catch {
                    
                    print(error)
                }
            case .failure(let error):
                
                print("Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
}

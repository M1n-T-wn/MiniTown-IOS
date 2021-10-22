//
//  ViewToggleModel.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/21.
//

import Foundation


var LoginDone = true
var signupDone = true


var checkId : String?
var checkPhone : String!

var certifiedPhone : String?

var checkIdDone = false
var checkCertifiedDone = true
// 에러가 고쳐진다면 꼭 고칠 것!!

struct SignUpInfo {
    var id : String?
    var phone : String?
    var checkPhone : String?
    var name : String?
    var loginType : String?
    var birth : String?
    var gender : String?
    var password : String?
    
}
var info = SignUpInfo()


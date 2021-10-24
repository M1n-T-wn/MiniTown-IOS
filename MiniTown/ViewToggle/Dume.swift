//
//  Dume.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/23.
//

import Foundation

//let mettingTitleLable = ["개발 한번 해야지", "오늘은 농구", "맛집 탐방 모임", "스케이트 한번 탈깨요", "애플 제품 모임", "스터디 모임"]
//let mettingLocationLable = ["동구", "둔산동", "장동", "한발", "서구", "시청로"]

struct mettingLable {
    let mettingTitleLable : [String]
    let mettingLocationLable : [String]
    var mettingInfoLable : [String] = []
    
    init() {
        self.mettingTitleLable =  ["개발 한번 해야지", "오늘은 농구", "맛집 탐방 모임", "스케이트 한번 탈깨요", "애플 제품 모임", "스터디 모임"]
        self.mettingLocationLable = ["동구", "둔산동", "장동", "한발", "서구", "시청로"]
        
        self.mettingInfoLable = ["10대부터 20대 분들까지 다양한 분들이 참여하는배구 동호회 입니다. 저희 활동은 주말에 활동하고 있습니다.",
                                 "10대부터 20대 분들까지 다양한 분들이 참여하는배구 동호회 입니다. 저희 활동은 주말에 활동하고 있습니다.",
                                 "10대부터 20대 분들까지 다양한 분들이 참여하는배구 동호회 입니다. 저희 활동은 주말에 활동하고 있습니다.",
                                 "10대부터 20대 분들까지 다양한 분들이 참여하는배구 동호회 입니다. 저희 활동은 주말에 활동하고 있습니다.",
                                 "10대부터 20대 분들까지 다양한 분들이 참여하는배구 동호회 입니다. 저희 활동은 주말에 활동하고 있습니다.",
                                 "10대부터 20대 분들까지 다양한 분들이 참여하는배구 동호회 입니다. 저희 활동은 주말에 활동하고 있습니다."]
        
    }
}

let MettingLable = mettingLable()

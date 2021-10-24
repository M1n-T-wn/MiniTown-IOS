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
    var mettingChatNessage : [String] = []
    var mettingImage : [String] = []
    
    
    init() {
        self.mettingTitleLable =  ["개발 한번 해야지", "오늘은 농구", "맛집 탐방 모임", "스케이트 한번 탈깨요", "애플 제품 모임", "스터디 모임"]
        self.mettingLocationLable = ["동구", "둔산동", "장동", "한발", "서구", "시청로"]
        
        self.mettingInfoLable = ["10대부터 20대 분들까지 다양한 분들이 참여하는 개발 동아리 입니다. 저희 활동은 주말에 활동하고 있습니다.",
                                 "중장년 어르신들이 참여하는 농구 동호회 입니다. 저녁에는 회식을 하고 있습니다. 많은 운동을 하고 있어요",
                                 "대전광역시 안에 있는 맜있는 맛집들을 탐방하고 있습니다. 저희는 회비의 일정 비용을 기부하는 착한 동호회 입니다.",
                                 "스케이트 타는 동아리입니다. 잠실 종합운동장에서 스케이트를 타고 있어요!!",
                                 "APPLE, iPhone, Pad, Apple Watch, MacBook, HomePod를 사랑하고, 팀쿡을 승배하는 평번한 기계덕후들의 모임입나다.",
                                 "수업을 해도 따라가기 힘든 고등학교 수업 난이도!! 우리는 그 어려움을 부시는 스터디 그룹입니다."]
        self.mettingChatNessage = ["오늘 개발 뭐 하실거에요?",
                                   "농구는 22시에 해요",
                                   "오늘 김밥 맛있었어요!!",
                                   "오늘 저 빙판에서 넘어졌어요ㅠㅠ",
                                   "이번에 M1 Pro 사실거죠?",
                                   "수학 2 시작합니다."]
        self.mettingImage = ["개발", "농구", "맛집", "스케이트", "애플", "스터디"]
    }
}

let MettingLable = mettingLable()

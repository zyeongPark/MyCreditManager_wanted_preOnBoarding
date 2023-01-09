//
//  main.swift
//  MyCreditManager
//
//  Created by 박지영 on 2022/11/23.
//

import Foundation

//git pull --no-rebase ## 깃헙 안될때

//전체 구조 (크게 case 1,2,3,4,5,x로 나누고 각 기능을 함수로 나눠두자)

//학생정보 저장용 딕셔너리
var student: [String:[String]] = [:]

//전체 구조
//책임을 쪼개면서 프로젝트를 구성하자.

var input = readLine()!
while true{
    switch input{
    case "1":
        print("학생 추가")
    case "2":
        print("학생 삭제")
    case "3":
        print("성적추가(변경)")
    case "4":
        print("성적삭제")
    case "5":
        print("평점보기")
    default:
        print("다시 입력하세요")
    }
}

//
//  practice.swift
//  MyCreditManager
//
//  Created by 박지영 on 2022/11/25.
//

import Foundation
//학생 이름 목록
var studentList: [String] = []
//학생 이름별 "과목 & 점수" 목록
//var studentGrade: [[String]] = []
var studentDict: [String:[String]] = [:]


//메뉴 입력 처리
while true{
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료" )
    let selectionList: [String] = ["1","2","3","4","5","X"]
    let selection = readLine()!
    if selectionList.contains(selection){

        //1. 학생 추가 (완)
        if selection == "1"{
            print("추가할 학생의 이름을 입력해주세요")
            let studentName = readLine()!
            print(addStudent(studentName))
            func addStudent(_: String) -> String{
                while true{
                    if studentList.contains(studentName){
                        let result = String(format: "%s는 이미 존재하는 학생입니다. 추가하지 않습니다.".replacingOccurrences(of: "%s", with: "%@"), studentName)
                        return result
                    }else if studentName == ""{
                        let result = "입력이 잘못되었습니다. 다시 확인해주세요."
                        return result
                    }else{
                        studentList.append(studentName)
                        let result = String(format: "%s 학생을 추가했습니다.".replacingOccurrences(of: "%s", with: "%@"), studentName)
                        return result
                    }
                }
            }
        }

        //2. 학생 삭제 (완)
        else if selection == "2"{
            print("삭제할 학생의 이름을 입력해주세요")
            let studentName = readLine()!
            print(deleteStudent(studentName))
            func deleteStudent(_: String) -> String{
                while true{
                    if studentList.contains(studentName){
                        if let index = studentList.firstIndex(of: studentName) {
                            studentList.remove(at: index)
                        }
                        let result = String(format: "%s 학생을 삭제하였습니다.".replacingOccurrences(of: "%s", with: "%@"), studentName)
                        return result
                    }else if studentName == ""{
                        let result = "입력이 잘못되었습니다. 다시 확인해주세요."
                        return result
                    }else {
                        let result = String(format: "%s 학생을 찾지 못했습니다.".replacingOccurrences(of: "%s", with: "%@"), studentName)
                        return result
                    }
                }
            }


        }
        //3. 성적 추가 (Ing)
        else if selection == "3"{
            print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            print("입력예) Mickey Swift A+")
            print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
            let input = readLine()!
            let inputGrade = input.split(separator: " ")
            print(addGrade(inputGrade))
            //print(inputGrrade)
            func addGrade(_: Array<Any>) -> String{
                //맞게 작성했는지 확인,
                if inputGrade.count != 3{
                    let result = "입력이 잘못되었습니다. 다시 확인해주세요. "
                    return result
                }
                //맞게 작성했다면, 성적 저장하기
                else{
                    let studentName = inputGrade[0]
                    let subject = inputGrade[1]
                    let grade = inputGrade[2]
//                    for student in studentList{//학생이 존재할 경우,
//                        if student == studentName{
//
//                        }else{
//                            studentList.append(studentName)
//
//                        }
//                    }
                    for (key, value) in studentDict{
                        if key == studentName{ //학생이 존재할 경우,
                            for val in value{//그 학생의 과목중
                                if val == subject{ //이미 존재하는 게 있다면
                                    //여기에서 갱신해주고
                                    var idx = value.firstIndex(of:val)! //과목 위치 확인
                                    var index = idx + 1 //과목 다음 위치에 있는 점수 인덱스 확인
                                    print(value)
                                    !!여기서 접근 실패 & 코드 문제점 깨달음 -> 너무 길고 뒤죽박죽이라 읽기가 어렵다... 

                                }else{//없다면 추가해주기
                                    studentDict.updateValue([String(subject),String(grade)], forKey: String(studentName))
                                }

                            }
                        }else{//학생이 존재하지 않는 경우, 학생이름, 과목, 점수 추가해준다.
                            studentDict.updateValue([String(subject),String(grade)], forKey: String(studentName))
                        }
                    }
                    let result = String(format: "%s 학생의 %s 과목이 %s로 추가(변경)되었습니다.".replacingOccurrences(of: "%s", with: "%@"), studentName as CVarArg,subject as CVarArg ,grade as CVarArg)
                    return result
                }
            }
        }


        //4. 성적 삭제
        else if selection == "4"{

        }


        //5. 평점보기
        else if selection == "5"{
//            print("평점을 알고 싶은 학생의 이름을 입력해주세요")
//            let studentName = readLine()!
//            print(thisisGrade(studentName))
//            func thisisGrade(String) -> String{
//
//            }

        }


        //6. 프로그램 종료
        else if selection == "X"{
            break
        }
    }else{
        print("뭔가 입력이 잘못 되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
    }

}


//종료
print("프로그램을 종료합니다...")


//딕셔너리 접근연습
import Foundation

var input = ["a","b","c","d","e"]
let x = "b"
let dlqfur = readLine()!
for val in input{
    if val == x{
        let idx = input.firstIndex(of: val)!
        input[idx] = dlqfur
        print(input[idx])
    }else{
        print("hey")
    }
}
print(input)

//
//  ContentView.swift
//  ToDoListTask1
//
//  Created by 김요한 on 2022/11/04.
//

// 1. 싱글페이지 어플리케이션으로 (프로토타입) 만든다.
// 2. 최상단에 내용입력하는 텍스트필드 우측에 저장 버튼
// 3. 하단에 리스트로 텍스트필드 테이터를 뿌려준다.
// 4. 각 리스트데이터를 수정/삭제할 수 있도록 버튼을 만들어준다.

// 11월 6일 Todo
// 1. 공백이 들어갈 때를 방지할 수 있는 방어코드를 적자 (구현완)
//  1-2 Alert: 내용을 입력해주세요.
// 2. 수정/ 삭제 버튼을 컨텍스트 메뉴로!
// 3. - 왜? 지금처럼 배치하는 경우(버튼) 리스트를 누르는 경우와 중복될 수 있음


import SwiftUI

struct ContentView: View {
    
    @State private var inputText: String = ""
    @State var todoListData: Array<String> = []
    
    var body: some View {
        VStack {
            HStack {
                // To do 내용을 입력하는 TextField
                TextField("Please Enter the Text", text: $inputText)
                
                // TextField 내용을 저장 후 리스트로 보여줍니다.
                Button {
                    inputListData()
//                    // 저장을 누른 후 TextField를 초기화한다.
//                    inputText = ""
                } label: {
                    Text("저장")
                    
                }
                
            }
            .padding(.horizontal)
            // 입력받은 내용을 보여주는 리스트
            List {
                
                //forEach로 뿌려준다.
                if !todoListData.isEmpty {
                    
                    ForEach(todoListData, id: \.self) { item in
                        HStack {
                            // 장식용 버전(추후 구현할 체크박스)
                            Image(systemName: "checkmark.square")
                            
                            Text("\(item)")
                            
                            Spacer()
                            
                            Button {
                                // 수정 액션 넣어야 합니다.
                            } label: {
                                Text("수정")
                            }
                            
                            Button {
                                // 삭제 액션 넣어야 합니다.
                            } label: {
                                Text("삭제")
                            }

                        }
                       
                        
                    }
                    
                } else {
                    Text("Empty")
                        .foregroundColor(.gray)
                }
            }
        }
      
    }
    func inputListData() {
        
        // 삼항연산자를 통해서 텍스트가 있으면 todolist_appen가 들어가고 없으면 추가를 할 수 없게
        // inputText 데이터가 있는 경우
        if !inputText.isEmpty {
            // 버튼을 눌렀을때 입력받은 inputText를 배열에 저장한다
            todoListData.append("\(inputText)")
            print("\(todoListData)")
            inputText = ""
        } else {
  
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

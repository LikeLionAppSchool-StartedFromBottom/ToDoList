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
// 2. 수정 / 삭제 버튼을 컨텍스트 메뉴로!
//  - 왜? 지금처럼 배치하는 경우(버튼) 리스트를 누르는 경우와 중복될 수 있음
//  2-1 삭제 버튼을 우선 구현하는 것으로!
//  2-2 수정 버튼은 나중에 구현하는 것으로!


import SwiftUI

struct ContentView: View {
    
    @State private var inputText: String = ""
    @State var todoListData: Array<String> = []
    @State private var showingAlert = false
    
    
    var body: some View {
        VStack {
            HStack {
                // To do 내용을 입력하는 TextField
                TextField("Please Enter the Text", text: $inputText)
                
                // TextField 내용을 저장 후 리스트로 보여줍니다.
                Button {
                    // 조건문을 통해서 텍스트가 있으면 todolist_appen가 들어가고 없으면 추가를 할 수 없게

                    if !inputText.isEmpty {
                        // inputText 데이터가 있는 경우
                        inputListData()
                    } else {
                        // inputText 데이터가 없는 경우
                        showingAlert = true
                    }
                } label: {
                    Text("save")
                }
                .alert("내용을 입력해주세요!", isPresented: $showingAlert) {
                    Button("OK") {}
                } message: {
                    // 텍스트 여러 줄 보여주기!
                    Text("""
                        내용을 입력하지 않으면...
                        추가해 줄 수 없어요...
                        우엥 ㅜㅜ
                        """)
                }
            }
        }
        .padding(.horizontal)
        // 입력받은 내용을 보여주는 리스트
        List {
            Section {
                //forEach로 뿌려준다.
                if !todoListData.isEmpty {
                    ForEach(todoListData, id: \.self) { item in
                        HStack {
                            // 장식용 버전(추후 구현할 체크박스)
                            Image(systemName: "checkmark.square")
                            Text("\(item)")
                            
                            Spacer()
                            //                        Button {
                            //                            // 수정 액션 넣어야 합니다.
                            //                        } label: {
                            //                            Text("수정")
                            //                        }
                            //
                            //                        Button {
                            //                            // 삭제 액션 넣어야 합니다.
                            //                        } label: {
                            //                            Text("삭제")
                            //                        }
                        }
                    }
                    .onDelete(perform: deleteItem)
                } else {
                    Text("Empty")
                        .foregroundColor(.gray)
                }
            }
        }
    }
    func inputListData() {
        // 버튼을 눌렀을때 입력받은 inputText를 배열에 저장한다
        todoListData.append("\(inputText)")
        // inputText를 초기화 합니다
        inputText = ""
    }
    func deleteItem(at offsets: IndexSet) {
        // p.272 배열에 있는 아이템을 remove하는 메소드를 활용하여
        // 화면에서만 삭제되는 기능이 아니라 데이터에서도 삭제되게 함!
        todoListData.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

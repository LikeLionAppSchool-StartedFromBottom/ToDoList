//
//  ContentView.swift
//  CloneToDoList
//
//  Created by 김보미 on 2022/11/14.
//

import SwiftUI

// 계란판, 붕어빵틀
struct TodoList: Identifiable {
    let id = UUID()
    var content: String
    // 각각의 리스트마다 체크박스 불리언타입으로 확인해주기
    var isChecked: Bool
}

struct ContentView: View {
    
    // 인풋텍스트를 담는 변수
    @State private var inputText: String = ""
    // todolists를 담는 배열
    @State private var todoLists = [TodoList]()
    
    
    var body: some View {
        VStack {
            // 앱 타이틀 "To Do List"
            Text("You Should Do It R.I.G.H.T.N.O.W!")
                .font(.title.bold())
            
            // 리스트 적어 넣을 공간(TextField)
            HStack {
                TextField(
                    "Input Your Task",
                    text: $inputText
                    // 엔터 치면 todoLists배열에 저장 되도록 하는 제스쳐
//                    onCommit: {
//                        appendTodoLists()
//                    }
                )
                Button (action: {
                    appendTodoLists()
                }, label: {
                    Image(systemName: "highlighter")
                })
            }
            
            // 투두 리스트 쪼르르 list아래 HStack을 바로 쓰면 두 개가 충돌이 일어남. 때문에 ForEach를 사용해서 하나씩 뿌려줘야한다.
            List {
                ForEach(0..<todoLists.count, id: \.self){ i in
                    HStack {
                        // 체크 박스 버튼
                        Button(action: {
                            toggleCheckedState(i)
                        }, label: {
                            Image(systemName: todoLists[i].isChecked == true ? "checkmark.circle" : "circle")
                        })
                        // 투두 리스트 텍스트
                        Text(todoLists[i].content)
                        Spacer()
                        // 삭제 버튼
                        Button(action: {}, label: {
                            Image(systemName: "trash")
                        })
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding()
    }
    
    // 텍스트필드의 입력받은 문자열을 변수 todoLists(배열)에 저장하는 함수
    func appendTodoLists() {
        let addList = TodoList(content: inputText, isChecked: false)
        todoLists.append(addList)
        inputText = ""
    }
    
    // TodoList의 체크 여부를 toggle하는 함수
    func toggleCheckedState(_ i: Int) {
        todoLists[i].isChecked.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

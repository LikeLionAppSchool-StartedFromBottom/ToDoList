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
//
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
                } label: {
                    Text("저장")
                    // 저장을 누른 다음에 초기화 기능을 넣는다
                }
                
            }
            // 입력받은 내용을 보여주는 리스트
            List {
                //forEach로 뿌려준다.
                ForEach(todoListData, id: \.self) { item in
                    Text("\(item)")
                }
                
            }
        }
        .padding()
    }
    func inputListData() {
        // 버튼을 눌렀을때 입력받은 inputText를 배열에 저장한다
        todoListData.append("\(inputText)")
        print("\(todoListData)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

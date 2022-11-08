//
//  ToDoList.swift
//  ToDoListTask1
//
//  Created by 김요한 on 2022/11/08.
//


//계란 , CarStore은 계란판

import SwiftUI

struct ToDoList : Identifiable {
    var id = UUID()
    var name: String
    var isDone: Bool
}

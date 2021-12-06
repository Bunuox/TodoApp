//
//  Task.swift
//  ToDoApp
//
//  Created by Bünyamin Kılıçer on 3.12.2021.
//

import Foundation
import SwiftUI

struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var color: Color
    var completed: Bool
    var description: String
    var createdDate: String
}


let MOCK_DATA = [Task(title: "title1", color: Color.red, completed: false,description: "dd",createdDate: "01/01/2022"),
                 Task(title: "title2", color: Color.purple, completed: false,description: "de",createdDate: "01/02/2022"),
                 Task(title: "title3", color: Color.green, completed: true,description: "df",createdDate: "01/03/2022")]

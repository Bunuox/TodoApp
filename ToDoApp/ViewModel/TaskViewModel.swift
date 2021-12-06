//
//  TaskViewModel.swift
//  ToDoApp
//
//  Created by Bünyamin Kılıçer on 3.12.2021.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var allTasks	= [Task]()
    
    init(){
        loadData()
    }
    
    func loadData(){
        self.allTasks = MOCK_DATA
    }
    
    func addTask(task: Task){
        self.allTasks.append(task)
    }
}

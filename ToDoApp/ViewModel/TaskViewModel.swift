//
//  TaskViewModel.swift
//  ToDoApp
//
//  Created by Bünyamin Kılıçer on 3.12.2021.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class TaskViewModel: ObservableObject {
    @Published var allTasks	= [Task]()
    let firestoreDatabase = Firestore.firestore()
    var firestoreReference: DocumentReference? = nil
    
    
    func getAllTasks() -> [Task]{
        loadData()
        return self.allTasks
    }
    
    func loadData(){
        self.firestoreDatabase.collection("Tasks").getDocuments(){ querySnapshot, err in
            if err == nil {
                self.allTasks.removeAll(keepingCapacity: false)
                for document in querySnapshot!.documents{
                    var task = Task(id: "", title: "", color: Color.white, completed: false, description: "", createdDate: "")
                    let colors = ["red":Color.red,"green":Color.green,"black":Color.black,"purple":Color.purple] as [String : Color]
                    
                    if let taskId = document.get("id") as? String{
                        task.id = taskId
                    }
                    
                    if let taskColor = document.get("color") as? String{
                        task.color = colors[taskColor]!
                    }
                    
                    if let taskCompleted = document.get("completed") as? Bool{
                        task.completed = taskCompleted
                    }
                    
                    if let taskCreatedDate = document.get("createdDate") as? String{
                        task.createdDate = taskCreatedDate
                    }
                    
                    if let taskDescription = document.get("description") as? String{
                        task.description = taskDescription
                    }
                    
                    if let taskTitle = document.get("title") as? String {
                        task.title = taskTitle
                    }
                    
                    self.allTasks.append(task)
                }
            }else{
                print(err)
            }
        }
    }
    
    func addTaskToCollection(task: Task, completion: @escaping(_ message: String)->()){
        let documentData = [
            "id" : task.id,
            "title": task.title,
            "color": task.color.description,
            "completed": String(task.completed),
            "description": task.description,
            "createdDate": task.createdDate
        ] as [String: Any]
        
        firestoreReference = firestoreDatabase.collection("Tasks").addDocument(data: documentData, completion: { err in
            if err == nil{
                completion("Successfull")
                self.allTasks.append(task)
            }else{
                completion("Error")
            }
        }
        )
    }
}

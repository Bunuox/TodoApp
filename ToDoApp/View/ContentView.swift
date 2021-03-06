//
//  ContentView.swift
//  ToDoApp
//
//  Created by Bünyamin Kılıçer on 3.12.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var taskVM = TaskViewModel()
    
    var body: some View{
        NavigationView{
            VStack {
                List{
                    ForEach(self.taskVM.getAllTasks()){
                        task in
                        NavigationLink  (destination: TaskDetails(taskVM: taskVM, editMode: false,title: task.title, color: task.color, description: task.description)){
                            
                            TaskCell(task: task,taskVM: taskVM).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/9,alignment: .leading)
                        }.buttonStyle(PlainButtonStyle()) //Navlink içinde kullanılacak her buton için bunu ekle.
                        .listRowBackground(task.color)
                        
                    }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/8)
                }
                
                NavigationLink(destination: TaskDetails(taskVM: self.taskVM,editMode: true)){
                    Text("Add Task")
                }
                
            }
        }.navigationTitle("Tasks")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TaskViewModel())
    }
}

//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Bünyamin Kılıçer on 3.12.2021.
//

import SwiftUI

struct TaskCell: View {
    @State var task: Task
    var taskVM: TaskViewModel
    var body: some View {
        HStack{
            Button {
                task.completed.toggle()
                DispatchQueue.main.async{
                    taskVM.updateTask(task: task)
                }
            } label: {
                if task.completed{
                    Image("checked")
                }else{
                    Image("unchecked")
                }
            }

            VStack(alignment:.leading){
                Text(task.title)
                .foregroundColor(Color.white)
                .font(.headline)
                HStack{
                    Text(task.createdDate)
                        .font(.subheadline)
                        .colorInvert()
                    
                    Text(task.description)
                        .font(.footnote)
                        .foregroundColor(Color.white)
                        //.fixedSize()
                        //.frame(width: 5, height: 5,alignment: .leading)
                }.frame(width: 170, height: 30, alignment: .leading)
                
            }.frame(width: 150, height: 50, alignment: .leading)
        }.fixedSize()
    }
}

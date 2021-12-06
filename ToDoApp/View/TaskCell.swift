//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Bünyamin Kılıçer on 3.12.2021.
//

import SwiftUI

struct TaskCell: View {
    var task: Task
    var body: some View {
        
        VStack(alignment:.leading){
            Text(task.title)
            .foregroundColor(Color.white)
            .font(.headline)
            HStack{
                Text(task.createdDate).font(.subheadline)
                Text(task.description).font(.footnote).foregroundColor(Color.white)
            }
            
        }
    }
}

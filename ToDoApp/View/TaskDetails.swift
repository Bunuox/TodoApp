//
//  TaskDetails.swift
//  ToDoApp
//
//  Created by Bünyamin Kılıçer on 3.12.2021.
//

import SwiftUI

struct TaskDetails: View {
    @ObservedObject var taskVM : TaskViewModel
    var editMode: Bool
    
    @State var showsAlert = false
    @State var title = "TEST"
    @State var color = Color.black
    @State var description = "DESCRIPTION"
    
    var body: some View {
        VStack{
            Spacer()
            if editMode{
                
                TextField("Title", text: $title).padding().colorInvert()
                TextField("Description",text: $description).padding().colorInvert()
                
                HStack{
                    Button {
                        self.color = Color.red
                    } label: {
                        Image(systemName: "circle.fill").foregroundColor(Color.red)
                    }
                    Button {
                        self.color = Color.green
                    } label: {
                        Image(systemName: "circle.fill").foregroundColor(Color.green)
                    }
                    Button {
                        self.color = Color.black
                    } label: {
                        Image(systemName: "circle.fill").foregroundColor(Color.black)
                    }
                    Button {
                        self.color = Color.purple
                    } label: {
                        Image(systemName: "circle.fill").foregroundColor(Color.purple)
                    }
                }
                
                Button {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/YYYY"
                    self.taskVM.addTask(task: Task(title: self.title, color: color, completed: false,description: self.description,createdDate: dateFormatter.string(from: Date.init())))
    
                } label: {
                    Text("Create Task")
    
                }.padding().alert(isPresented: $showsAlert) {
                    Alert(title: Text("Successfull"), message: Text("Succesfully Added"), dismissButton: .cancel())
                }
                
            }
            else{
                Text(title)
                    .frame(width: UIScreen.main.bounds.width, height: 30, alignment: .leading).colorInvert()
                
                Text(description)
                    .frame(width: UIScreen.main.bounds.width, height: 90, alignment: .leading).colorInvert()
            }
            
            Spacer()
        }
        .background(color).ignoresSafeArea()
    }
}
/*
struct TaskDetails_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetails(editMode: false)
    }
}
*/

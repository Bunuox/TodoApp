//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Bünyamin Kılıçer on 3.12.2021.
//

import SwiftUI
import Firebase

@main
struct ToDoAppApp: App {
    let persistenceController = PersistenceController.shared
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

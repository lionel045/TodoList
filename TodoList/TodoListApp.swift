//
//  TodoListApp.swift
//  TodoList
//
//  Created by Lion on 19/03/2022.
//

import SwiftUI

/*
 
  MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Model for View
 */


@main
struct TodoListApp: App {
    
    @StateObject var listWiewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
               
                ListView()
            }
                    
            .environmentObject(listWiewModel)
        }
    }
}

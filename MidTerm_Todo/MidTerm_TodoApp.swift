//
//  MidTerm_TodoApp.swift
//  MidTerm_Todo
//
//  Created by student on 3/22/22.
//

import SwiftUI

@main
struct MidTerm_TodoApp: App {
    
    @StateObject var listViewModal : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
            ListView()
            }
            .environmentObject(listViewModal)
        }
    }
}

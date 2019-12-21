//
//  ContentView.swift
//  TaskList
//
//  Created by Elisha Limanu on 14/12/19.
//  Copyright © 2019 Elisha Limanu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    var taskStore: TaskStore
    @ObservedObject var taskStore: TaskStore
    @State var isModalPresent: Bool = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(taskStore.prioritizedTasks) { index in
                    SectionView(prioritizedTask: self.$taskStore.prioritizedTasks[index])
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Task")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button(
                        action: {
                            self.isModalPresent = true
                        }
                    ) {
                        Image(systemName: "plus")
                    }
            )
                
            .sheet(isPresented: $isModalPresent) {
                NewTaskView( taskStore: self.taskStore )
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( taskStore: TaskStore() )
    }
}

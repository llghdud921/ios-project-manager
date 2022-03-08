//
//  ContentView.swift
//  ProjectManager
//
//  Created by 이호영 on 2022/03/01.
//

import SwiftUI

struct MainScene: View {
    @ObservedObject var viewModel: ProjectManagerViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                TaskListView(items: viewModel.todoTasks, listName: TaskStatus.todo.title)
                TaskListView(items: viewModel.doingTasks, listName: TaskStatus.doing.title)
                TaskListView(items: viewModel.doneTasks, listName: TaskStatus.done.title)
            }.navigationBarTitle("Project Manager", displayMode: .inline)
        }.navigationViewStyle(.stack)
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProjectManagerViewModel()
        MainScene(viewModel: viewModel)
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewDisplayName("iPad Pro (12.9-inch)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

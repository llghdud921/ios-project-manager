//
//  DetailScene.swift
//  ProjectManager
//
//  Created by 이호영 on 2022/03/08.
//

import SwiftUI

struct DetailScene: View {
    @EnvironmentObject var viewModel: ProjectManagerViewModel
    @ObservedObject var task: Task
    @Binding var showDetailScene: Bool
    @State var isShowEditScene: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TaskDetailView(
                    title: $task.title,
                    content: $task.content,
                    limitDate: $task.limitDate
                )
            }
            .padding()
            .navigationBarTitle("TODO", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButtonView(show: $isShowEditScene)
                        .sheet(isPresented: $isShowEditScene, onDismiss: nil) {
                            EditScene(showEditScene: $isShowEditScene, task: task)
                        }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    DismissButtonView(show: $showDetailScene)
                }
            }
        }
    }
}

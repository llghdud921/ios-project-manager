//
//  EditScene.swift
//  ProjectManager
//
//  Created by 이호영 on 2022/03/08.
//

import SwiftUI

@available(iOS 15.0, *)
struct AddScene: View {
    @ObservedObject var taskViewModel: TaskViewModel
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var limitDate: Date = Date()
    @Binding var showAddScene: Bool
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TaskEditView(
                    title: $title,
                    content: $content,
                    limitDate: $limitDate
                )
            }
            .padding()
            .navigationBarTitle("TODO", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    DoneButtonView(show: $showAddScene) {
                        if title != "", content != "" {
                            taskViewModel.createTask(title: title, content: content, limitDate: limitDate)
                        } else {
                            showAlert.toggle()
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    DismissButtonView(show: $showAddScene)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("알림"), message: Text("다시 입력하세요."), dismissButton: .none)
            }
        }
        .navigationViewStyle(.stack)
    }
}

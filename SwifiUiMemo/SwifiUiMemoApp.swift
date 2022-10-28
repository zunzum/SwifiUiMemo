//
//  SwifiUiMemoApp.swift
//  SwifiUiMemo
//
//  Created by 동준 on 2022/10/28.
//

import SwiftUI

@main
struct SwifiUiMemoApp: App {
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}

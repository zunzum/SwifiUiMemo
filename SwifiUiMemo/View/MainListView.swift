//
//  MainListView.swift
//  SwifiUiMemo
//
//  Created by 동준 on 2022/10/28.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store : MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                NavigationLink {
                    DetailView(memo: memo)
                } label: {
                    //memoCell을 View>MemoCell파일로 빼놨다
                    MemoCell(memo: memo)
                }
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            .toolbar {
                Button{
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }
        
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}

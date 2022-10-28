//
//  MainListView.swift
//  SwifiUiMemo
//
//  Created by 동준 on 2022/10/28.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store : MemoStore
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                //memoCell을 View>MemoCell파일로 빼놨다
                MemoCell(memo: memo)
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
        }
        
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}

//
//  ComposeView.swift
//  SwifiUiMemo
//
//  Created by 동준 on 2022/10/28.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store : MemoStore
    
    //메모가 전달되면 쓰기모드 아니면 편집모드 아래 코드 기점으로 분기
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    //이렇게 선언한 속성을 State Va뭐시기로 부른다는데..?
    @State private var contnet: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //content속성과 Texteditor가 바인딩 되고 입력한 내용이 content속성에 자동 저장
                TextEditor(text: $contnet)
                    .padding()
                    .onAppear {
                        if let memo = memo {
                            contnet = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "Memo Crystal" : "Bird Memo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let memo = memo {
                            store.update(memo: memo, content: contnet)
                        } else {
                            store.insert(memo: contnet)
                        }
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
    
    struct ComposeView_Previews: PreviewProvider {
        static var previews: some View {
            ComposeView()
                .environmentObject(MemoStore())
        }
    }
}

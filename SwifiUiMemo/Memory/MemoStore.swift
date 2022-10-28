//
//  MemoStore.swift
//  SwifiUiMemo
//
//  Created by 동준 on 2022/10/28.
//

import Foundation

class MemoStore : ObservableObject{
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "자는구나..", insertDate: Date.now),
            Memo(content: "자니?", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "자?", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id}
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}

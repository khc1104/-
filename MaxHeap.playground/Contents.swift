import Foundation

class MaxHeap<T: Comparable> {
    private var tree: [T] = []
    
    //Heap에 푸시할 때는 맨 뒤에 넣고 부모와 비교하면서 정렬
    func push(node: T) {
        tree.append(node)
        heapifyUp()
    }
    
    //Heap에서 팝 할 때는 루트 노드를 반환하고, 마지막 노드를 루트노드로 올린 후 자식노드들과 비교하면서 정렬
    //* 빈 Heap, node가 하나인 heap은 예외처리 해야함
    func pop() -> T? {
        guard !tree.isEmpty else { return nil } // 빈 heap이면 nil 반환
        guard let top: T = tree.first else { return nil }
        
        if tree.count == 1 { return tree.removeFirst() } //heap에 루트만 있으면 해당 요소를 팝
        tree[0] = tree.removeLast()
        
        heapifyDown()
        return top
    }
    
    //푸쉬 후 정렬하는 함수
    private func heapifyUp() {
        var idx = tree.count - 1
        
        while idx > 0 {
            let parent = (idx - 1) / 2
            
            if tree[parent] >= tree[idx] { break }
            swap(parent, idx)
            idx = parent
        }
    }
    
    //팝 후 정렬하는 함수
    private func heapifyDown() {
        var idx = 0
        
        while true {
            let leftIdx = (idx * 2) + 1
            let rightIdx = (idx * 2) + 2
            
            var maxIdx = idx
            
            if leftIdx < tree.count && tree[leftIdx] > tree[maxIdx] { maxIdx = leftIdx }
            if rightIdx < tree.count && tree[rightIdx] > tree[maxIdx] { maxIdx = rightIdx }
            if maxIdx == idx { break }
            swap(idx, maxIdx)
            idx = maxIdx
        }
    }
    
    //두 노드를 바꾸는 함수
    private func swap(_ idx1: Int, _ idx2: Int) {
        let tmp = tree[idx1]
        tree[idx1] = tree[idx2]
        tree[idx2] = tmp
    }
    
    func printValues(){
        print(tree)
    }
}

//let heap = MaxHeap<Int>()
//
//let arr = [55, 14, 11, 13, 27]
//
//arr.forEach { heap.push(node: $0) }
//
//heap.printValues()
//print(heap.pop())
//heap.printValues()
//
//let heap2 = MaxHeap<Int>()
//
//heap2.push(node: 2)
//print(heap2.pop())
//heap2.printValues()


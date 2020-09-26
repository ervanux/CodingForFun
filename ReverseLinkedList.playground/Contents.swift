/*
 https://leetcode.com/problems/reverse-linked-list/
 
 Runtime: 16 ms, faster than 87.20% of Swift online submissions for Reverse Linked List.
 Memory Usage: 15 MB, less than 100.00% of Swift online submissions for Reverse Linked List.
 
*/


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

final class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var stack = [ListNode]()
        stack.append(head)
        while stack.last!.next != nil {
            stack.append(stack.last!.next!)
        }
        
        for i in stride(from: stack.count-1, to: -1, by: -1) {
            if i == 0 {
                stack[i].next = nil
            } else {
                stack[i].next = stack[i - 1]
            }
        }
        return stack.last
    }
}

/*
 https://leetcode.com/problems/two-sum/
 
 Runtime: 32 ms, faster than 95.27% of Swift online submissions for Two Sum.
 Memory Usage: 14.8 MB, less than 100.00% of Swift online submissions for Two Sum.
 */



final class Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var lookup = [Int: Int]()
        for (index, val) in nums.enumerated() {
            if let i = lookup[target - val] {
                return [i, index]
            }
            
            if lookup[val] == nil {
                lookup[val] = index
            }
        }
        return [-1,-1]
    }
}

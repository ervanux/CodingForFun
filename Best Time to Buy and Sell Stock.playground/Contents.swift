/*
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 
 Runtime: 24 ms, faster than 100.00% of Swift online submissions for Best Time to Buy and Sell Stock.
 Memory Usage: 14.6 MB, less than 99.86% of Swift online submissions for Best Time to Buy and Sell Stock.
 */

final class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        var maxProfit = 0
        var index = 0
        var buy = Int.max
        while index < prices.count {
            if buy >= prices[index] {
                buy = prices[index]
                index += 1
            } else {
                var subIndex = index
                var sell = prices[subIndex]
                while subIndex < prices.count {
                    if sell <= prices[subIndex] {
                        sell = prices[subIndex]
                    }
                    subIndex += 1
                }
                maxProfit = max(sell - buy, maxProfit)
                buy = Int.max
            }
        }
        
        return maxProfit
    }
}

Solution().maxProfit([7,1,5,3,6,4]) == 5
Solution().maxProfit([7,6,4,3,1]) == 0
Solution().maxProfit([2,4,1]) == 2
Solution().maxProfit([4,11,1,2,7]) == 7
Solution().maxProfit([6,1,3,2,4,7]) == 6

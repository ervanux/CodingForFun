/*
 https://leetcode.com/problems/word-break/
 
 Runtime: 12 ms, faster than 100.00% of Swift online submissions for Word Break.
 Memory Usage: 14.5 MB, less than 100.00% of Swift online submissions for Word Break.
 */


final class Solution {
    var cache:[Substring: Bool] = [:]
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        func wordBreak(_ s: Substring) -> Bool {
            if let val = cache[s] {
                return val
            }

            var result = false
            for word in wordDict {
                if s.starts(with: word) {
                    let nextIndex = s.index(s.startIndex, offsetBy: word.count)
                    if nextIndex == s.endIndex {
                        result = true
                        break
                    }
                    if wordBreak(s[nextIndex...]) {
                        result = true
                        break
                    } else {
                        continue
                    }
                }
            }
            
            cache[s] = result
            return result
        }
        
        var wordSet: Set<Unicode.Scalar> = []
        wordDict.forEach {
            wordSet = wordSet.union(Set($0.unicodeScalars))
        }
        
        if !Set(s.unicodeScalars).isSubset(of: wordSet) {
            return false
        }
        
        return wordBreak(s[s.startIndex...])
    }
}

Solution().wordBreak("leetcode", ["leet","code"]) == true
Solution().wordBreak("bb", ["a","b","bbb","bbbb"]) == true
Solution().wordBreak("cars",["car","ca","rs"]) == true
Solution().wordBreak("catsandog", ["cats","dog","sand","and","cat"]) == false
Solution().wordBreak("goalspecial", ["go","goal","goals","special"]) == true
Solution().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]) == false
Solution().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",["aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa","ba"]) == false

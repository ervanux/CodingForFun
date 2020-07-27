/// https://leetcode.com/problems/word-break/

final class Solution {
    func wordBreak2(_ deep: Int, _ sub: Substring, _ wordDict: [String]) -> Bool {
        for word in wordDict where sub.starts(with: word) {
            let pointer = sub.index(sub.startIndex, offsetBy: word.count)
            if pointer == sub.endIndex {
                return true
            }
            if wordBreak2(deep + 1,sub[pointer...], wordDict) {
                return true
            }
        }
        return false
    }

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        let first = Set(s.unicodeScalars)
        let second = Set(wordDict.joined().unicodeScalars)
        if first.count > second.count {
            return false
        }
        if !first.isSubset(of: second) {
            return false
        }
        
        let sorted = wordDict.sorted { $0.count > $1.count }
        var array = [String]()
        for (index, word) in sorted.enumerated() {
            var new = sorted
            new.remove(at: index)
            if !wordBreak2(1, word[word.startIndex...], new) {
                array.append(word)
            }
        }
        print("   ")
        return wordBreak2(1, s[s.startIndex...], array)
    }
}

//Solution().wordBreak("leetcode", ["leet","code"])
//Solution().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])

Solution.init().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",["aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa","ba"])

//Solution().wordBreak("bb", ["a","b","bbb","bbbb"])
//
//Solution().wordBreak("cars",["car","ca","rs"])
//Solution().wordBreak("catsandog", ["cats","dog","sand","and","cat"])

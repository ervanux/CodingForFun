final class Solution {
    var set = Set<[String]>()
    var wordDict: [String]!
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        self.wordDict = wordDict
        guard Set(wordDict.reduce("", +)).isSuperset(of: Set(s)) else {
            return []
        }
        wordBreak(s[...s.index(s.endIndex, offsetBy: -1)])
        return Array(set).map{ $0.joined(separator:" ")}
    }
        
    func wordBreak(_ s: Substring, _ words: [String] = []) {
        for word in wordDict where s.hasPrefix(word) {
            var newWords = words
            newWords.append(word)
            let newSub = s[s.index(s.startIndex, offsetBy: word.count)...]
            if newSub.isEmpty{
                set.insert(newWords)
            } else {
                wordBreak(newSub, newWords)
            }
        }
    }
}

Solution().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])
Solution().wordBreak("baba", ["ab", "ba"])
Solution().wordBreak("bb", ["a","b","bbb","bbbb"])

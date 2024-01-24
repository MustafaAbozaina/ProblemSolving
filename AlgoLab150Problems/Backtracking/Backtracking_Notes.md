
# Learned lessons 

### backtracking is meant to check from specific solutions that needed a recursion 
examples:
## subsets 
let input = [1,2,3]
let expectedResult = [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
XCTAssertEqual(subsetsWithDup([1,2,2]), [[],[1],[1,2],[1,2,2],[2],[2,2]])
##Permutation
let input = [1,2,3]
let expectedOutput = Set([[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]])
XCTAssertEqual(Set(letterCombinations("234")),  Set(["ad","ae","af","bd","be","bf","cd","ce","cf"]))

// this question check palindrome subset, so we backtrack through string if we found the substring is palindrome we complete and add another elements to check if they also palindromes, If we found something like [ab], which is not a palindrome we [backtrack] by removing [b] and take step back to check from other solution, this the main point of backtraing 
Input: s = "aab"
Output: [["a","a","b"],["aa","b"]]
XCTAssertEqual(Set(partition("aaab")), Set([["a", "a", "a", "b"], ["a", "aa", "b"], ["aa", "a", "b"], ["aaa", "b"]]))



## Ideas of how to solve It 
### If we found that the solution, with every element we need to combine different element, So we need to [make a loop] and inside the loop we make a backtrack for the new elements. I'm explaining the loop here because It could make the question easier because It could be good starting point   
### Imagination is very useful in backtracking questions, you could reduce the problem and draw It on the paper if you felt distracted 
 
## Coding example 

    func partition(_ s: String) -> [[String]] {

     var result: [[String]] = []
     backtrack(0, [], s: s, result: &result)
     return result
    }
    
    func isPalindrome(_ string: String) -> Bool {
        return string == String(string.reversed())
    }
    
    func backtrack(_ start: Int, _ currPartition: [String], s: String, result: inout [[String]]) {
        if start == s.count {
            result.append(currPartition)
            return
        }
        
        let sArray = Array(s)
        for end in start..<s.count {
            let substring = String(sArray[start...end])
            if isPalindrome(substring) {
                backtrack(end + 1, currPartition + [substring], s: s, result: &result)
            }
        }
    }

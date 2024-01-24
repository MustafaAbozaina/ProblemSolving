
# learned lessons from dynamic sliding window 

### dynmaic sliding window has a little like two indicator pointers, we have left and right indicator, unlike the fixed sliding window, where fixed size move forward in a fixed window sliding, but dynmaic sliding, we have left and right, they move forward but not always move at the same time and has the same space between each other, It depends on certain cases, so left could be at 0 and right could be in arr.count - 1, also, left could be at arr.count - 2 and right could be arr.count -1 so that It's dynamic  

### exmaple: The question of String that we get from It the longest string that doesn't have repeated characters like "tmmzxut", here the longest value should be 5 because It will start from second "m" to last "t", here we have left indicator that indicate to the beginning of counting the new string that has no repeated character 

### When to use It: In examples related to detecting specific cases in substring or sub array like the following example 
   
Coding example: 

    // This is using dynamic size sliding window
    func lengthOfLongestSubstringRightAnswer(_ s: String) -> Int {
        let n = s.count
        var maxLength = 0
        var charMap = [Character: Int]()
        var left = 0
        var right = 0
        
        let characters = Array(s)
        
        while right < n {
            let currentChar = characters[right]
            
            // If the current character is already in the map, update the left pointer to the next position after the previous occurrence of the character
            if let index = charMap[currentChar] {
                left = max(left, index + 1)
            }
            
            // Update the maximum length if necessary
            maxLength = max(maxLength, right - left + 1)
            
            // Update the latest index of the current character in the map
            charMap[currentChar] = right
            
            right += 1
        }
        
        return maxLength
    }

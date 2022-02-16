//
//  CaeserCipher.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/13/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

func caeserCipher(word: String, encyptionKey: Int) -> String {
    // original alphabet
    let wordArray = Array(word)
    let originals = "abcdefghijklmnopqrstuvwxyz"
    let originalsUpperCased = originals.uppercased()
    let originalsArray = Array(originals)
    let originalsUpperCasedArray = Array(originalsUpperCased)
    var encryptedString = ""
    
    for i in 0..<wordArray.count {
        var encryptedIndex = -1
        for j in 0..<originalsArray.count {
            
            if wordArray[i].lowercased() == String(originalsArray[j]) {
                encryptedIndex = getCharacterIndex(originalsCount: originalsArray.count, currentIndex: j, k: encyptionKey)
                if (wordArray[i].isUppercase) {
                    encryptedString += String(originalsUpperCasedArray[encryptedIndex])
                }else {
                    
                encryptedString += String(originalsArray[encryptedIndex])
                }
            }
        }
        if encryptedIndex == -1 {
            encryptedString += String(wordArray[i])
        }
    }
    return encryptedString
}

private func getCharacterIndex(originalsCount: Int, currentIndex: Int, k: Int) -> Int {
    var encryptedIndex = -1
    if (currentIndex + k) < originalsCount {
        encryptedIndex = currentIndex + k
    }else
    if (currentIndex + k) >= originalsCount {
        encryptedIndex = (currentIndex + k) - originalsCount
    }
    if encryptedIndex >= originalsCount {
    return getCharacterIndex(originalsCount: originalsCount, currentIndex: currentIndex, k: k - originalsCount)
    }else {
        return encryptedIndex
    }
}

extension Array {
    func toIndexedDictionary() -> Dictionary<String, Any> {
        var dic = [String: Any]()
        for i in 0..<self.count {
            dic["\(i)"] = self[i]
        }
        return dic
    }
}

//
//sort(a.begin(), a.end());
//   int mid = (n )/2;
//   swap(a[mid], a[n-1]);
//
//   int st = mid + 1;
//   int ed = n - 1;
//   while(st < ed - 1){
//       swap(a[st], a[st+1]);
//       st = st + 1;
//       // ed = ed + 1 ;
//   }
//   for(int i = 0; i < n; i++){
//       if(i > 0) cout << " ";
//       cout << a[i];
//   }
//   cout << endl;

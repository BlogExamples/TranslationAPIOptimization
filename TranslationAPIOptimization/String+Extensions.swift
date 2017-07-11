//
//  String+Extensions.swift
//  TranslationAPIOptimization
//
//  Created by JoshuaKuehn on 7/11/17.
//  Copyright © 2017 JoshQNBlog. All rights reserved.
//

import Foundation

extension String {
  
  /* 
   // This will remove all white spaces at the beginning and end of a string.
   // Example
   var a = "   hello    "
   a.trim()
   print(a) // "hello"
  */
  func trim() -> String {
    return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }
  
  /*
   // This function removes consecutive whitespaces and replaces them with a single whitespace
   // Example
   var x = "hello    world "
   x.removeExtraWhiteSpaces()
   print(x) // "hello world"
  */
  func removeExtraWhiteSpaces() -> String {
    var newString = ""
    var isFirstSpace = true
    for character in self.trim().characters {
      
      if character != " " {
        newString.append(character)
        isFirstSpace = true
      } else {
        if isFirstSpace { newString.append(character) }
        isFirstSpace = false
      }
      
    }
    return newString
  }
  
}

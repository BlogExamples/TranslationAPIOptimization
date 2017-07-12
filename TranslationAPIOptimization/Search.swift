//
//  Search.swift
//  TranslationAPIOptimization
//
//  Created by JoshuaKuehn on 7/10/17.
//  Copyright © 2017 JoshQNBlog. All rights reserved.
//

import Foundation
import Alamofire

typealias SearchComplete = (_ isSuccessful: Bool, _ response: String) -> Void

class Search {
  
  static func requestTranslation(source: String, target: String, textToTranslate: String, completeion: @escaping SearchComplete) {
    
    // Add URL parameters
    let urlParams = [
      "target": target,
      "q": textToTranslate,
      "key": Secrets.apiTranslationKey,
      "source": source,
      ]
    
    // Fetch Request
    Alamofire.request("https://translation.googleapis.com/language/translate/v2", parameters: urlParams)
      .validate()
      .responseJSON { (response) in
        if let json = response.result.value as? [String: Any] {
          if let data = json["data"] as? [String: Any] {
            if let translations = data["translations"] as? [[String:Any]] {
              let translatedTextDict = translations[0]
              if let result = translatedTextDict["translatedText"] as? String {
                completeion(true, result)
              }
            }
          }
        }
        
      }
    
  }
  
}

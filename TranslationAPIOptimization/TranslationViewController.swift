//
//  ViewController.swift
//  TranslationAPIOptimization
//
//  Created by JoshuaKuehn on 7/10/17.
//  Copyright © 2017 JoshQNBlog. All rights reserved.
//

import UIKit

class TranslationViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let translateNavButton = UIBarButtonItem(title: "Translate", style: .plain, target: self, action: #selector(translateNavButtonTapped(button:)))
    
    navigationItem.rightBarButtonItem = translateNavButton
    Search.requestTranslation(source: "en", target: "de", textToTranslate: "Hello") { (isSuccessful, result) in
      print("done")
    }
  }
  
  func translateNavButtonTapped(button: UIBarButtonItem) {
    print("Tapped")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


//
//  ViewController.swift
//  TranslationAPIOptimization
//
//  Created by JoshuaKuehn on 7/10/17.
//  Copyright © 2017 JoshQNBlog. All rights reserved.
//

import UIKit

class TranslationViewController: UIViewController {
  
  var toTranslateTV = UITextView(frame: .zero)
  var fromTranslateTV = UITextView(frame: .zero)
  var middleLayoutGuide = UILayoutGuide()
  
  var items:[UIView] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    let translateNavButton = UIBarButtonItem(title: "Translate", style: .plain, target: self, action: #selector(translateNavButtonTapped(button:)))
    
    self.view.addLayoutGuide(middleLayoutGuide)
    
    items = [
      toTranslateTV,
      fromTranslateTV,
    ]
    
    items.forEach { $0.translatesAutoresizingMaskIntoConstraints = false; self.view.addSubview($0) }
    
    //Apply constraints to the layoutGuide
    NSLayoutConstraint.activate([
      middleLayoutGuide.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      middleLayoutGuide.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      middleLayoutGuide.widthAnchor.constraint(equalTo: self.view.widthAnchor),
      middleLayoutGuide.heightAnchor.constraint(equalToConstant: 16)
    ])
    
    //Apply constraints to fromTranslateTV
    NSLayoutConstraint.activate([
      fromTranslateTV.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
      fromTranslateTV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      fromTranslateTV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      fromTranslateTV.bottomAnchor.constraint(equalTo: middleLayoutGuide.topAnchor)
    ])
    
    //Apply constraints to toTranslateTV
    NSLayoutConstraint.activate([
      toTranslateTV.topAnchor.constraint(equalTo: self.middleLayoutGuide.bottomAnchor),
      toTranslateTV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      toTranslateTV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      toTranslateTV.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor)
    ])
    
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


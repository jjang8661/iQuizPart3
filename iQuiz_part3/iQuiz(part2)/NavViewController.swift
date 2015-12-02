//
//  NavViewController.swift
//  iQuiz(part2)
//
//  Created by seowoosuk on 11/14/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {
    
    var totalCorrect = 0;
    var totalSolved = 0;
    var newQuiz = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

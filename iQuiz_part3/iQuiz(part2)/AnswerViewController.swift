//
//  AnswerViewController.swift
//  iQuiz(part2)
//
//  Created by seowoosuk on 11/12/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var yourAnswer: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var correctAnswer = String()
    var selectedAnswer = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let nav = self.navigationController as! NavViewController

        nav.totalSolved++
        
        if selectedAnswer == correctAnswer {
            self.correctLabel.text = "Correct!"
            self.yourAnswer.text = "You chose \(selectedAnswer) which was right!"
            nav.totalCorrect++
        } else {
            self.correctLabel.text = "Wrong!"
            self.yourAnswer.text = " You chose \(selectedAnswer), the correct answer was \(correctAnswer)"
        }
    
        self.scoreLabel.text = "Your score : \(nav.totalCorrect) / \(nav.totalSolved)"
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back To Questions", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
    }
    
    func back(sender: UIBarButtonItem) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: false);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//
//  SolveViewController.swift
//  iQuiz(part2)
//
//  Created by seowoosuk on 11/12/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import UIKit

class SolveViewController: UIViewController {
    
    var question : Question?


    @IBOutlet weak var questionView: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        self.answer1.setTitle(question!.answers[0], forState: .Normal)
        self.answer2.setTitle(question!.answers[1], forState: .Normal)
        self.answer3.setTitle(question!.answers[2], forState: .Normal)
        self.answer4.setTitle(question!.answers[3], forState: .Normal)
        self.questionView.text = question!.question
        
        self.answer1.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        self.answer2.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        self.answer3.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        self.answer4.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func moveToAnswer(sender : UIButton) {
        self.performSegueWithIdentifier("goToAnswer", sender: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let view = segue.destinationViewController as! AnswerViewController
        let button = sender as! UIButton
        
        view.selectedAnswer = (button.titleLabel?.text)!
        view.correctAnswer = (self.question?.correctAnswer)!
        
    }
}

//
//  QuestionViewController.swift
//  iQuiz(part2)
//
//  Created by seowoosuk on 11/12/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var questions = [Question]()
    var currQuestion : Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quizCell", forIndexPath: indexPath) as! QuizCell
        
        let q = self.questions[indexPath.row]
       
        
        cell.quizQuestion.text = q.text
  
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currQuestion = self.questions[indexPath.row]
        let solveView = SolveViewController()
        solveView.question = currQuestion
        self.performSegueWithIdentifier("goToSolve", sender:solveView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let view = segue.destinationViewController as! SolveViewController
        let send = sender as! SolveViewController
        view.question = send.question
   
    }
}

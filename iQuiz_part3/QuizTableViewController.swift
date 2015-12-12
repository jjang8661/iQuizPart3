//
//  QuizTableViewController.swift
//  iQuiz(part2)
//
//  Created by seowoosuk on 11/12/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import UIKit

struct Question {
    var text : String
    var answers : [String]
    var answer : String
}


class QuizTableViewController: UITableViewController {
    
    var jsonData = [AnyObject]()
    

    var quizNames = ["Science!","Marvel Super Heroes","Mathematics"]
    var QuizDetail = ["Because SCIENCE!","Avengers, Assemble!","Did you pass the third grade?"]
    var QuestionSet = [[Question]]()
    
    let quizImages = [UIImage(named: "ScienceIcon"),UIImage(named: "HeroIcon"),UIImage(named: "MathIcon")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        if NSUserDefaults.standardUserDefaults().objectForKey("data") != nil {
            print("has value")
            jsonData = NSUserDefaults.standardUserDefaults().objectForKey("data") as! [AnyObject]
        } else {

            print("no vlaue")
        }
    }

    override func viewWillAppear(animated: Bool) {
          if NSUserDefaults.standardUserDefaults().objectForKey("data") != nil {
        NSUserDefaults.standardUserDefaults().setObject(jsonData, forKey: "data")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        for subject in jsonData {
            
            var quizNames = [String]()
            var QuizDetail = [String]()
            
            let title = subject["title"]!
            quizNames.append(title as! String)
            
            let desc = subject["desc"]
            QuizDetail.append(desc as! String)
            
            let questions = subject["questions"] as! [AnyObject]
            var questionList = [Question]()
            for question in questions {
                let text = question["text"] as! String
                let answerIndex = Int(question["answer"] as! String)!
                let answer = question["answers"]!![answerIndex-1] as! String
                let answers = question["answers"] as! [String]
                
                questionList.append(Question(text: text, answers: answers, answer: answer))
            }
            QuestionSet.append(questionList)
        }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quizImages.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quizCell", forIndexPath: indexPath) as! QuizCell
        
        cell.quizTitle.text = self.quizNames[indexPath.row]
        cell.quizDescription.text = self.QuizDetail[indexPath.row]
        cell.quizImage.image = self.quizImages[indexPath.row]
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "settingsPopover" {
            //dont do anything important yet
            if let destination = segue.destinationViewController as? SettingsViewController {
                    destination.delegate = self
                }
        } else {
            let cell = sender as! QuizCell
            let questionController = segue.destinationViewController as! QuestionViewController

            switch cell.quizTitle.text! {
            case quizNames[0]:
                questionController.questions = QuestionSet[0]
                questionController.navigationItem.title = quizNames[0]+"Quiz"
            case quizNames[1]:
                questionController.questions = QuestionSet[1]
                questionController.navigationItem.title = quizNames[1]+"Quiz"
            case quizNames[2]:
                questionController.questions = QuestionSet[2]
                questionController.navigationItem.title = quizNames[2]+"Quiz"
            default :
                break
            }

        }
    }
    
    
    @IBAction func exit(segue:UIStoryboardSegue) {
        print("Move back to")
    }
    
    func setData(data:[AnyObject]) {
        jsonData = data
    }
    
    
}

//
//  QuizTableViewController.swift
//  iQuiz(part2)
//
//  Created by seowoosuk on 11/12/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import UIKit

struct Question {
    var question : String
    var answers : [String]
    var correctAnswer : String
}


class QuizTableViewController: UITableViewController {
    
   
//    let nav = self.navigationController as! NavViewController
    
    var jsonData = [AnyObject]()
    var quizNames = [String]()
    var QuizDetail = [String]()
    


    
    let quizImages = [UIImage(named: "MathIcon"),UIImage(named: "ScienceIcon"),UIImage(named: "HeroIcon")]
    
    let MathQuiz = [Question(question:"1+2", answers: ["1","2","3","4"] , correctAnswer: "3"),
                    Question(question:"3-2", answers: ["1","2","3","4"] , correctAnswer: "1")]
    let ScienceQuiz = [Question(question:"What is the boiling point of water?(in Celcious)", answers: ["100","200","3000","400"] , correctAnswer: "100"),
        Question(question:"What is freezing point of water?(in Celcious)", answers: ["-1","-2","-3","0"] , correctAnswer: "0")]
    let HeroesQuiz = [Question(question:"question 1", answers: ["100","200","300","400"] , correctAnswer: "100"),
        Question(question:"question 2", answers: ["-1","-2","-3","0"] , correctAnswer: "0")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller. 
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

//        for(var i = 0; i < jsonData.count; i++) {
//            quizNames.append(jsonData[i]["title"])
//            QuizDetail.append(jsonData[i]["descr"]
//        }
        
        
        quizNames = ["Math","Science","Heroes"]
        QuizDetail = ["This is Math", "This is Science", "This is Heroes" ]

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
            case "Math" :
                questionController.questions = self.MathQuiz
                questionController.navigationItem.title = "Math Quiz"
            case "Science" :
                questionController.questions = self.ScienceQuiz
                questionController.navigationItem.title = "Science Quiz"
            case "Heroes" :
                questionController.questions = self.HeroesQuiz
                questionController.navigationItem.title = "Heroes Quiz"
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

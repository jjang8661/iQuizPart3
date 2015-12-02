//
//  SettingsViewController.swift
//  iQuiz(part2)
//
//  Created by seowoosuk on 11/17/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var urlField: UITextField!
    
    var newQuiz = [AnyObject]()
    var delegate : QuizTableViewController?
    
    @IBAction func downloadNewQ(sender: UIButton) {
        let newURL = self.urlField.text
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let URL = NSURL(string:newURL!)
        
        let request = NSMutableURLRequest(URL:URL!)
        request.HTTPMethod = "GET"
        
        let task = session.dataTaskWithRequest(request) {(data, response, error) -> Void in
            
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            
            print("URL Session Task Succeeded: HTTP \(statusCode)")
            
            do {
                self.newQuiz = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                
//                let navController : NavViewController = self.view.window?.rootViewController as! NavViewController
//                navController.newQuiz = self.newQuiz as NSArray as [AnyObject]
                self.delegate?.setData(self.newQuiz)

            } catch {
                //report error
            }
        }
        
        //Kick off the task
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.urlField.text = "http://tednewardsandbox.site44.com/questions.json"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

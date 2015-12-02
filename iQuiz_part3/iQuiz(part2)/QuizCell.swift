//
//  QuizCell.swift
//  iQuiz(part2)
//
//  Created by seowoosuk on 11/12/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {
    
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var quizDescription: UILabel!
    @IBOutlet weak var quizTitle: UILabel!
    @IBOutlet weak var quizQuestion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the vieiw for the selected state
    }
}

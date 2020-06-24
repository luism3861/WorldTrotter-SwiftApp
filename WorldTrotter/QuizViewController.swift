//
//  QuizViewController.swift
//  WorldTrotter
//
//  Created by Luis Eduardo Madina Huerta on 23/06/20.
//  Copyright © 2020 Luis Eduardo Madina Huerta. All rights reserved.
//

import UIKit

class QuizViewController:UIViewController{
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let questions:[String] = [
        "What is 7 + 7",
        "What is the capital of Vermont?",
        "What is cognac name from?"
    ]
    
    let answers:[String] = [
        "14",
        "no mames no se we",
        "apoco si we"
    ]
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
            currentQuestionIndex += 1
            if currentQuestionIndex == questions.count{
                currentQuestionIndex = 0
            }
            let question:String = questions[currentQuestionIndex]
            questionLabel.text = String(question)
            answerLabel.text = "???"
        print(question)
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer:String = answers[currentQuestionIndex]
        answerLabel.text = String(answer)
    }
}

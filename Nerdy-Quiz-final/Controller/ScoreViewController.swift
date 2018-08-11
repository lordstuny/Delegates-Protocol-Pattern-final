//
//  ScoreViewController.swift
//  Nerdy-Quiz
//
//  Created by Mensah Shadrach on 10/08/2018.
//  Copyright © 2018 Mensah Shadrach. All rights reserved.
//

import UIKit

class ScoreViewController:UIViewController{
    
    var allAnswers:[String:String]?
    var myScore:Int!
    @IBOutlet weak var scorelabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workAnswers()
        
        
    }
    
    //Dismisses score view and start another quiz
    @IBAction func tryAgain(_ sender:UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    /*Helper function to work out the correct answers*/
    
    func workAnswers(){
        myScore = 0
        if(allAnswers != nil){
            for (key, value) in allAnswers!{
                let correctAnswer = correctAnswers[key]
                if correctAnswer != nil{
                    if(correctAnswer! == value){
                        myScore += 1
                    }
                }
            }
        }
        scorelabel.text = String(myScore).appending("/10")
    }
    
    
}

//
//  ViewController.swift
//  Nerdy-Quiz
//
//  Created by Mensah Shadrach on 10/08/2018.
//  Copyright © 2018 Mensah Shadrach. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,
NerdyQuizDelegate {

    
    
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var scoreButton:UIButton!
    
    var allnerdyQuestions:Array<NerdyQuestion>!
    var allCorrectNerdyAnswers:Dictionary<String,String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNerdyQuestions()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        allCorrectNerdyAnswers = [:]
        scoreButton.isEnabled = false
        scoreButton.backgroundColor = UIColor.lightGray
        tableView.reloadData()
    }
    
/*Helper function to transform questions dictionary into an array of NerdyQuestion Objects
*/
    func getNerdyQuestions(){
        allnerdyQuestions = []
        
        for (key,value) in allquestions {
            if let value = value as? [String:String]{
                let ques = NerdyQuestion(id: key, question: value[QS]!,
                    op1: value[OP1]!, op2: value[OP2]!, op3: value[OP3]!, op4: value[OP4]!)
                allnerdyQuestions.append(ques)
            }
        }
        
    }
    
    @IBAction func checkMyScorePressed(_ sender:UIButton){
        performSegue(withIdentifier:"checkMyScorePressed", sender: allCorrectNerdyAnswers);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "checkMyScorePressed"{
            if let destination = segue.destination as? ScoreViewController{
                let allAnswers = sender as? [String:String]
                if allAnswers != nil{
                    destination.allAnswers = allAnswers!
                }
            }
        }
    }
    
    
    //MARK:- UITABLEVIEW DELEGATE/DATASOURCE METHODS
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allnerdyQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:
            String.init(describing: QuizViewCell.self), for: indexPath) as? QuizViewCell{
            let nerdyquestion = allnerdyQuestions[indexPath.row]
            
            cell.delegate = self
            
            cell.configureView(nerdquestion: nerdyquestion)
            
            return cell
        }
        return QuizViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }
    
    //MARK:- NERDYQUIZ DELEGATES
    
    func didFinishSelectingOption(with id: String, and option: String) {
        allCorrectNerdyAnswers[id] = option
        if allCorrectNerdyAnswers.count == allnerdyQuestions.count{
            scoreButton.isEnabled = true
            scoreButton.layer.backgroundColor = UIColor(red: 14/255, green: 171/255, blue: 1, alpha: 1).cgColor
        }
    }
    
    func selectedOption(for id: String) -> String? {
        let selected = allCorrectNerdyAnswers[id]
        return selected
    }
    
    
    
}









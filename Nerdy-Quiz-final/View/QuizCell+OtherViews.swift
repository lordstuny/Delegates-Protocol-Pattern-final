//
//  QuizCell+OtherViews.swift
//  Nerdy-Quiz
//
//  Created by Mensah Shadrach on 10/08/2018.
//  Copyright © 2018 Mensah Shadrach. All rights reserved.
//
import UIKit

protocol NerdyQuizDelegate:class {
    func didFinishSelectingOption(with id:String, and option:String)
    func selectedOption(for id:String) -> String?
}

class QuizViewCell:UITableViewCell{
    
    @IBOutlet weak var questionlabel:UILabel!
    @IBOutlet weak var option1:NerdyButton!
    @IBOutlet weak var option2:NerdyButton!
    @IBOutlet weak var option3:NerdyButton!
    @IBOutlet weak var option4:NerdyButton!
    weak var delegate:NerdyQuizDelegate?
    var question:NerdyQuestion!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        option1.setupButton(index: 1)
        option2.setupButton(index: 2)
        option3.setupButton(index: 3)
        option4.setupButton(index: 4)
    }
    
    /*
     Due to reusablilty of UITableViewCells, we override this function to prepare a dequeued cell and rid it of any data or config from its previous cell
     */
    
    override func prepareForReuse() {
        super.prepareForReuse()
        option1.setupButton(index: 1)
        option2.setupButton(index: 2)
        option3.setupButton(index: 3)
        option4.setupButton(index: 4)
    }
    
    /*Over here we configure the actual view of the Cells. We receive the NerdyQuetion object and then set the lables and buttons with data from NerdyQuestion*/
    
    func configureView(nerdquestion:NerdyQuestion){
        
        questionlabel.text = nerdquestion.question
        option1.setTitle(nerdquestion.option1, for: .normal)
        option2.setTitle(nerdquestion.option2, for: .normal)
        option3.setTitle(nerdquestion.option3, for: .normal)
        option4.setTitle(nerdquestion.option4, for: .normal)
        question = nerdquestion
        
        let selected = delegate?.selectedOption(for: nerdquestion.id)
        var index = nerdquestion.contains(an: selected)
        if index != nil {
            index! += 1
            setSelectedOption(index: index!)
        }
    }
    
    func setSelectedOption(index:Int){
        switch index {
        case 1:
            option1.setAttrsOnPressed(index: 1)
            break
        case 2:
            option2.setAttrsOnPressed(index: 2)
            break
        case 3:
            option3.setAttrsOnPressed(index: 3)
            break
        case 4:
            option4.setAttrsOnPressed(index: 4)
            break
        default:
            break
        }
    }
    
    //Button 1 matched to Option 1 Actions of button that is invoked when a button is pressed or receives the Touch Up Inside event
    
    @IBAction func didPressOption1(_ sender:NerdyButton){
        sender.setAttrsOnPressed(index: 1)
        clearOnSelect(index: 1)
        delegate?.didFinishSelectingOption(with: question.id, and: sender.currentTitle!)
        
    }
    
    //Button 2 matched to Option 2 Actions of button that is invoked when a button is pressed or receives the Touch Up Inside event
    
    @IBAction func didPressOption2(_ sender:NerdyButton){
        sender.setAttrsOnPressed(index: 2)
        clearOnSelect(index: 2)
        delegate?.didFinishSelectingOption(with: question.id, and: sender.currentTitle!)
        
    }
    //Button 3 matched to Option 3 Actions of button that is invoked when a button is pressed or receives the Touch Up Inside event
    
    @IBAction func didPressOption3(_ sender:NerdyButton){
        sender.setAttrsOnPressed(index: 3)
        clearOnSelect(index: 3)
        delegate?.didFinishSelectingOption(with: question.id, and: sender.currentTitle!)
    }
    //Button 4 matched to Option 4 Actions of button that is invoked when a button is pressed or receives the Touch Up Inside event
    
    
    @IBAction func didPressOption4(_ sender:NerdyButton){
        sender.setAttrsOnPressed(index: 4)
        clearOnSelect(index: 4)
       delegate?.didFinishSelectingOption(with: question.id, and: sender.currentTitle!)
        
    }
    
    /*
     Method called when a button is pressed :- This is a conveninet method to update the views of the other buttons in a cell once one of the buttons are pressed. In the case where a user changes his/her mind about an already selected option, selecting another option may leave the views having multipel buttons in the selected state. This method, remedies that by setting all other buttons whose index is not passed in to this method to their default unselected state
     */
    func clearOnSelect(index:Int){
        switch index {
        case 1:
            option2.setupButton(index: 2)
            option3.setupButton(index: 3)
            option4.setupButton(index: 4)
            break
        case 2:
            option1.setupButton(index: 1)
            option3.setupButton(index: 3)
            option4.setupButton(index: 4)
            break
        case 3:
            option1.setupButton(index: 1)
            option2.setupButton(index: 2)
            option4.setupButton(index: 4)
            break
        case 4:
            option1.setupButton(index: 1)
            option3.setupButton(index: 3)
            option2.setupButton(index: 2)
            break
        default:
            break
        }
    }
    
    
}



 //Custom classes for setting attributes and designs of our views

class NerdyButton:UIButton{
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /*
     Performs initial setup and styling of our custom buttons
     */
    func setupButton(index:Int){
        layer.backgroundColor = UIColor.clear.cgColor //Background Color
        layer.borderColor = makeColor(index: index); //set a border radius of button
        layer.cornerRadius = 5.0 //Sets Corner radius of button
        layer.borderWidth = 1.0
        setTitleColor(UIColor(cgColor: makeColor(index: index)), for: .normal)//Sets button text font color
        
    }
    
    /*
     Changes the appearance of our custom buttons after it is pressed or receives the Touch Up Inside event
     */
    
    func setAttrsOnPressed(index:Int){
        layer.backgroundColor = makeColor(index: index)
        setTitleColor(UIColor.white, for: .normal)
    }
    
    //Helper method to generate nice CGColor based on the index or position of the custom button
    func makeColor(index:Int)-> CGColor{
        switch index {
        case 1:
            return UIColor(red: 46/255, green: 125/255, blue: 50/255, alpha: 1).cgColor //Green
        case 2:
            return UIColor(red: 165/255, green:0, blue:1, alpha: 1).cgColor //Voilet
        case 3:
            return UIColor(red: 14/255, green: 171/255, blue: 1, alpha: 1).cgColor //Sea Blue
            
        default:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor //Black
        }
    }
}
/*
 Convenient UIView subclass to help set some shadows and elevation for our QuizViewCell container view
 */
class ContainerView:UIView{
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width: 0, height: 2);
    }
}



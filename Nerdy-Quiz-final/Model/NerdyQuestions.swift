//
//  NerdyQuestions.swift
//  Nerdy-Quiz
//
//  Created by Mensah Shadrach on 10/08/2018.
//  Copyright © 2018 Mensah Shadrach. All rights reserved.
//

import Foundation

struct NerdyQuestion {
    
    
    private var _id:String
    private var _question:String
    private var _option1:String
    private var _option2:String
    private var _option3:String
    private var _option4:String
    
    var id:String{
        return _id
    }
    var question:String{
        return _question
    }
    var option1:String{
        return _option1
    }
    var option2:String{
        return _option2
    }
    var option3:String{
        return _option3
    }
    
    var option4:String{
        return _option4
    }
    
    
    
    init(id:String, question:String, op1:String, op2:String, op3:String,op4:String) {
        _id = id
        _question = question
        _option1 = op1
        _option2 = op2
        _option3 = op3
        _option4 = op4
    }
    
    func contains(an option:String?)->Int?{
        if option == nil{ return nil }
        let arr = [_option1,_option2,_option3,_option4]
        for opt in arr{
            if opt == option!{
                return arr.firstIndex(of: opt)
            }
        }
        return nil
    }
    
}


/*Data used in the quiz, generated right off the top of my head.
 */

let allquestions:[String:Any] = [
    "q1":[QS:"Who is the father of C", OP1:"Dennis Ritchie",OP2:"Bjarnes Stroustroup",OP3:"Ken Thompson",OP4:"Douglas McIlroy"],
    "q2":[QS:"Which year was swift released", OP1:"2014",OP2:"2015",OP3:"2002",OP4:"2010"],
    "q3":[QS:"Linux OS was developed by", OP1:" Linux Zerger",OP2:"Linus Altman",OP3:"Linus Torvalds",OP4:"Konrad Zuse"],
    "q4":[QS:"Intel based CPU x86 processors use", OP1:"big-endian",OP2:"little-endian",OP3:"raw-endian",OP4:"no-endian"],
    "q5":[QS:"The first iOS SDk was released in", OP1:"2007",OP2:"2008",OP3:"2009",OP4:"2010"],
    "q6":[QS:"iOS apps were originally written in", OP1:"ObjectiveC",OP2:"Python",OP3:"Ruby",OP4:"Java"],
    "q7":[QS:"Which is an intepreted language", OP1:"C++",OP2:"Java",OP3:"Ruby",OP4:"Haskell"],
    "q8":[QS:"LLVM was developed by", OP1:"Chris Lattner",OP2:"Apple",OP3:"Ken Thompson",OP4:"Google"],
    "q9":[QS:"Which of these is not an assembler", OP1:"MASM",OP2:"FASM",OP3:"CASM",OP4:"NASM"],
    "q10":[QS:"Which is a 64-bit register", OP1:"RCX",OP2:"EAX",OP3:"AL",OP4:"EBP"]]

let QS = "question"
let OP1 = "op1"
let OP2 = "op2"
let OP3 = "op3"
let OP4 = "op4"


//Correct answers  used by the scoreView to parse your answers and see how well you did
let correctAnswers:[String:String] = [
    "q1": "Dennis Ritchie",
    "q2":"2014",
    "q3":"Linus Torvalds",
    "q4":"little-endian",
    "q5": "2008",
    "q6":"ObjectiveC",
    "q7":"Ruby",
    "q8":"Chris Lattner",
    "q9":"CASM",
    "q10":"RCX"
]


//
//  ViewController.swift
//  Trivia
//
//  Created by Abraham Belayneh on 3/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numQuestionLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var entertainmentLabel: UILabel!
    
    @IBOutlet weak var questionView: UIView!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    var buttons: [UIButton] = []
    
    var correctAnswers = 0
    
    var currentAnswerIndex = 0
    
    var correctAnswer = ""
    
    let questions = [
        ("What was the first weapon pack for 'PAYDAY'?",
         ["The Gage Weapon Pack #1", "The Overkill Pack", "The Gage Chivalry Pack", "The Gage Historical Pack"],
         "The Gage Weapon Pack #1"),
        ("Who developed the game 'Half-Life'?",
         ["Valve", "EA", "Ubisoft", "Bethesda"],
         "Valve"),
        ("Who direct the dark Knight",
        ["Christopher Nolan", "David Fincher", "Quentin Tarantino", "Martin Scorsese"],
        "Christopher Nolan")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        setupButtons()
        loadQuestion()
    }
    
    func setupButtons(){
        let buttons = [button1, button2, button3, button4]
        for (index, button) in buttons.enumerated() {
            button?.layer.cornerRadius = 8
            button?.backgroundColor = UIColor.lightGray
            button?.tag = index
        }
    }
    
    func loadQuestion(){
        numQuestionLabel.text = "Question \(currentAnswerIndex + 1)/\(questions.count)"
        let (question, answers, correct) = questions[currentAnswerIndex]
        questionLabel.text = question
        correctAnswer = correct
        let buttons = [button1, button2, button3, button4]
        for (index, answer) in answers.enumerated() {
            buttons[index]?.setTitle(answer, for: .normal)
        }
    
    }
    
    func nextQuestion(){
        
        if currentAnswerIndex + 1 < questions.count
        {
            currentAnswerIndex += 1
            loadQuestion()
            setupButtons()
        } else{
            let alert = UIAlertController(title: "Game Over", message: "You got \(correctAnswers)/\(questions.count) questions correct", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: { self.currentAnswerIndex = 0
                self.loadQuestion()
            })
            }
    }
    
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        let buttons = [button1, button2, button3, button4]
        for button in buttons {
            button?.backgroundColor = UIColor.lightGray
        }
        
        sender.backgroundColor = UIColor.darkGray
        // Print the selected answer (For debugging)
        print("Selected Answer: \(sender.titleLabel?.text ?? "Unknown")")
    }
    
    @IBAction func processCorrectAnswer(_ sender: UIButton) {
        if sender.titleLabel?.text == correctAnswer {
            sender.setTitle( "Correct!", for: .normal)
            sender.backgroundColor = .green
            nextQuestion()
        } else {
            sender.setTitle("incorrect", for: .normal)
            sender.backgroundColor = .red
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

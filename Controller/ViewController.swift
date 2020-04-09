//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    var calculator = Calculator()
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }

    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        if expressionHaveResult {
            textView.text = ""
        }
        textView.text.append(numberText)
        calculator.addNewNumber(Int(numberText)!)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" + ")
            calculator.addOperator("+")
        } else {
            alerteOperator()
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" - ")
            calculator.addOperator("-")
        } else {
           alerteOperator()
        }
    }

    @IBAction func tappedMultiplyButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" x ")
            calculator.addOperator("*")
        } else {
            alerteOperator()
        }
    }

    @IBAction func tappedDivideButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" / ")
            calculator.addOperator("/")
        } else {
            alerteOperator()
        }
    }

    @IBAction func tappedResetButton(_ sender: UIButton) {
        textView.text = ""
        calculator.clear()
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard expressionIsCorrect else {
           return alerteCorrectExpression()
        }

        guard expressionHaveEnoughElement else {
            return alerteStartNewCalcul()
        }

        textView.text.append(" = \(calculator.calcul())")
        calculator.clear()
    }

    private func alerteOperator() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    private func alerteCorrectExpression() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !",
        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    private func alerteStartNewCalcul() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

}

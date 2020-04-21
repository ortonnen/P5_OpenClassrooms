//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: Proprieties
    ///IBOutlet
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    ///Proprieties
    var operand = String()
    var calculator = Calculator()
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    /// Error check computed variables
    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }
    var expressionIsEmpty: Bool {
        return textView.text == "" || textView.text == "0"
    }
    var calculIsFinish: Bool {
        return textView.text.contains("=")
    }

    // MARK: Methodes
    /// View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /// View action add operand
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        if expressionIsEmpty {
            textView.text = ""
        }
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        if expressionHaveResult {
            textView.text = ""
        }
        textView.text.append(numberText)
        operand += numberText
    }
    /// View action addition calculation
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        guard expressionIsEmpty == false else {
            return alertCorrectExpression()
        }
        guard calculIsFinish == false else {
            return alertStartNewCalcul()
        }
        addOperand()
        if calculator.expressionIsCorrect {
            textView.text.append(" + ")
            calculator.addOperator("+")
        }
    }
    /// View action substraction calculation
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        guard expressionIsEmpty == false else {
            return alertCorrectExpression()
        }
        guard calculIsFinish == false else {
            return alertStartNewCalcul()
        }
        addOperand()
        if calculator.expressionIsCorrect {
            textView.text.append(" - ")
            calculator.addOperator("-")
        }
    }
    /// View action multiplication calculation
    @IBAction func tappedMultiplyButton(_ sender: UIButton) {
        guard expressionIsEmpty == false else {
            return alertCorrectExpression()
        }
        guard calculIsFinish == false else {
            return alertStartNewCalcul()
        }
        addOperand()
        if calculator.expressionIsCorrect {
            textView.text.append(" x ")
            calculator.addOperator("*")
        }
    }
    /// View action division calculation
    @IBAction func tappedDivideButton(_ sender: UIButton) {
        guard expressionIsEmpty == false else {
            return alertCorrectExpression()
        }
        guard calculIsFinish == false else {
            return alertStartNewCalcul()
        }
        addOperand()
        if calculator.expressionIsCorrect {
            textView.text.append(" / ")
            calculator.addOperator("/")
        }
    }
    /// View action reset calculation
    @IBAction func tappedResetButton(_ sender: UIButton) {
        textView.text = "0"
        calculator.clear()
    }
    /// View action end of calculation show result
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard expressionIsEmpty == false && calculIsFinish == false else {
            return alertStartNewCalcul()
        }
        addOperand()
        if calculator.expressionIsCorrect {
            do {
            textView.text.append(" = \(try calculator.calcul())")
            calculator.clear()
            } catch CalculatorError.divideByZero {
                print("\(CalculatorError.divideByZero.rawValue)")
                return alertErrorDivide()
            } catch CalculatorError.missingOperator {
                print("\(CalculatorError.missingOperator.rawValue)")
                return alertCorrectExpression()
            } catch {
                print("error")
            }
        }
    }

    // MARK: Private Methods
    /// add operand for calcul
    private func addOperand() {
        guard operand != "" else {
            return alertOperator()
        }
        calculator.addOperand(Double(operand)!)
        operand = ""
    }
    // MARK: Alerte
    ///if there is already an operator
    private func alertOperator() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    ///if the calculation cannot take place operator or operand error
    private func alertCorrectExpression() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !",
        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    ///informs of the end of the previous calculation invites to start a calculation again
    private func alertStartNewCalcul() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    ///attempt to divide by zero
    private func alertErrorDivide() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Impossible de diviser par 0 !",
        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

}

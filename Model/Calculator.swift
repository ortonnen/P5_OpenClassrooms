//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nathalie Ortonne on 02/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    var numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var operators = ["+", "-", "/", "*", "="]
    var result = 0
    var total = 0
    var calculNumber = [Int]()
    var calculelements = [String]()

    
    func addNewNumber(_ newNumber: Int) {
        if let number = calculNumber.last {
            var numberMutable = number
            numberMutable += newNumber
            calculNumber[calculNumber.count-1] = numberMutable
        }
    }

    func calcul() {
        let left = calculNumber[0]
        let right = calculNumber [1]
        let operand = operators[0]

        while calculNumber.count >= 2 && operators.description != "=" {

        switch operand {
        case "+":
           result = additionCalcul(left: left, right: right)
        case "-":
            result = substractionCalcul(left: left, right: right)
        case "/":
            result = divisionCalcul(left: left, right: right)
        case "*":
            result = multiplicationcalcul(left: left, right: right)
        default:
            break
        }
        calculNumber.insert(result, at: 0)
        }
    }

    private func additionCalcul(left: Int, right: Int) -> Int {
        result = left + right
        return result
    }

    private func substractionCalcul(left: Int, right: Int) -> Int {
        result = left - right
        return result
    }

    private func divisionCalcul(left: Int, right: Int) -> Int {
        if left != 0 && right != 0 {
            result = left / right
            return result
        }
        return 0
    }

    private func multiplicationcalcul(left: Int, right: Int) -> Int {
        result = left * right
        return result
    }
}

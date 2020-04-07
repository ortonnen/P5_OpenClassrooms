//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nathalie Ortonne on 02/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    var operators = [String]()
    var result = 0
    var calculNumber = [Int]()

    func addNewNumber(_ newNumber: Int) {
        calculNumber.append(newNumber)
    }

    func addOperator(_ newOperator: String) {
        if newOperator != "*" || newOperator != "/" {
        
        } else {
        operators.append(newOperator)
        }
    }

    func calcul() -> Int {
        while calculNumber.count >= 2 {
            var total = 0
            let left = calculNumber[0]
            let right = calculNumber [1]
            let operand = operators[0]

            switch operand {
            case "+":
                total = additionCalcul(left: left, right: right)
            case "-":
                total = substractionCalcul(left: left, right: right)
            case "/":
                total = divisionCalcul(left: left, right: right)
                operators.removeFirst()
            case "*":
                total = multiplicationcalcul(left: left, right: right)
                operators.removeFirst()
            case "=":
                operators.removeLast()
                return total
            default:
                break
            }
            result = total
            calculNumber.removeFirst()
            calculNumber.removeFirst()
            operators.removeFirst()
            calculNumber.insert(total, at: 0)
        }
        return result
    }

    func clear() {
        calculNumber.removeAll()
        operators.removeAll()
    }
    private func priorityCalcul() -> Bool {
        // if oprérateur * ou / alors calcul commence par lui
        // else nil
        return true
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
        } else {
            return -99999
        }
    }

    private func multiplicationcalcul(left: Int, right: Int) -> Int {
        result = left * right
        return result
    }
}

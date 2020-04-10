//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nathalie Ortonne on 02/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    // MARK: Proprities
    var operators = [String]()
    var operands = [Int]()

    ///check if the calculation contains priority operator
    var isAPriorityOperator: Bool {
        for usedOperator in operators {
            if usedOperator == "*" || usedOperator == "/"{
                return true
            }
        }
        return false
    }

    var result = 0

    // MARK: Internal Methode
    /// Number Array
    func addNewNumber(_ newNumber: Int) {
        operands.append(newNumber)
    }

    /// Operator Array
    func addOperator(_ newOperator: String) {
        operators.append(newOperator)
    }

    /// Calculation logic method
    func calcul() -> Int {
        while operands.count >= 2 {
            var index = 0

            if operators.contains("*") {
                index = operators.firstIndex(of: "*") ?? 0
            } else if operators.contains("/") {
                index = operators.firstIndex(of: "/") ?? 0
            }

            let left = operands[index]
            let right = operands [index + 1]
            let usedOperator = operators[index]

            switch usedOperator {
            case "+":
                result = additionCalcul(left: left, right: right)
            case "-":
                result = substractionCalcul(left: left, right: right)
            case "*":
                result = multiplicationcalcul(left: left, right: right)
            case "/":
                result = divisionCalcul(left: left, right: right)
            default:
                break
            }
            operands.remove(at: index)
            operands.remove(at: index)
            operators.remove(at: index)
            operands.insert(result, at: index)
        }
        return result
    }

    ///methode to remove all array
    func clear() {
        operands.removeAll()
        operators.removeAll()
    }

    // MARK: Private Methode

    private func additionCalcul(left: Int, right: Int) -> Int {
        return left + right
    }

    private func substractionCalcul(left: Int, right: Int) -> Int {
        return left - right
    }

    private func divisionCalcul(left: Int, right: Int) -> Int {
        if left != 0 && right != 0 {
            return left / right
        } else {
            return -99999
        }
    }

    private func multiplicationcalcul(left: Int, right: Int) -> Int {
        return left * right
    }
}

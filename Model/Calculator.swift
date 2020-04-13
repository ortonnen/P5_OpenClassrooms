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
    var operands = [Double]()

    var result: Double = 0

    var expressionIsCorrect: Bool {
        return operators.count < operands.count - 1 && expressionHaveEnoughElement
    }
    var expressionHaveEnoughElement: Bool {
        return operators.count >= 1 && operands.count >= 2
    }
    var calculIsPossible: Bool {
        if operators.contains("/") {
            let index = operators.firstIndex(of: "/") ?? 0
            let left = operands[index]
            let right = operands[index + 1]
            return left != 0 && right != 0
        }
        return true
    }

    // MARK: Internal Methode
    /// Number Array
    func addOperand(_ newNumber: Double) {
        operands.append(newNumber)
    }

    /// Operator Array
    func addOperator(_ newOperator: String) {
        operators.append(newOperator)
    }

    /// Calculation logic method
    func calcul() -> Double {
        while expressionHaveEnoughElement {
            var index = 0

            if operators.contains("*") {
                index = operators.firstIndex(of: "*") ?? 0
            } else if operators.contains("/") {
                index = operators.firstIndex(of: "/") ?? 0
            }

            let left = operands[index]
            let right = operands[index + 1]
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

    private func additionCalcul(left: Double, right: Double) -> Double {
        return left + right
    }

    private func substractionCalcul(left: Double, right: Double) -> Double {
        return left - right
    }

    private func divisionCalcul(left: Double, right: Double) -> Double {
        if left != 0 && right != 0 {
            return left / right
        } else {
            return -9999
        }
    }

    private func multiplicationcalcul(left: Double, right: Double) -> Double {
        return left * right
    }
}

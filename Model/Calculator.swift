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
    var calculNumber = [Int]()

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
        calculNumber.append(newNumber)
    }

    /// Operator Array
    func addOperator(_ newOperator: String) {
        operators.append(newOperator)
    }

    /// Calculation logic method
    func calcul() -> Int {
        priorityCalcul()
        while calculNumber.count >= 2 {
            let left = calculNumber[0]
            let right = calculNumber [1]
            let usedOperator = operators[0]

            switch usedOperator {
            case "+":
                result = additionCalcul(left: left, right: right)
            case "-":
                result = substractionCalcul(left: left, right: right)
            default:
                break
            }
            calculNumber.removeFirst()
            calculNumber.removeFirst()
            operators.removeFirst()
            calculNumber.insert(result, at: 0)
        }
        return result
    }

    ///methode to remove all array
    func clear() {
        calculNumber.removeAll()
        operators.removeAll()
    }

    // MARK: Private Methode
    ///Calculation logic method for prioritu Operator
    private func priorityCalcul() {
        while isAPriorityOperator == true {
            for usedOperator in operators {
                let priorityOperator = usedOperator
                if priorityOperator == "*" || priorityOperator == "/" {
                    if let operatorIndex = operators.firstIndex(of: priorityOperator) {
                        let left = calculNumber[operatorIndex]
                        let right = calculNumber [operatorIndex + 1]
                        let usedPriorityOperator = operators[operatorIndex]

                        switch usedPriorityOperator {
                        case "*":
                            result = multiplicationcalcul(left: left, right: right)
                        case "/":
                            result = divisionCalcul(left: left, right: right)
                        default:
                            break
                        }
                        calculNumber.remove(at: operatorIndex)
                        calculNumber.remove(at: operatorIndex)
                        operators.remove(at: operatorIndex)
                        calculNumber.insert(result, at: operatorIndex)
                    }
                }
            }
        }
    }

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

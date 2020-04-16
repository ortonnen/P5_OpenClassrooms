//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nathalie Ortonne on 02/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    // MARK: Enum
    enum CalculatorError: Error {
        case divideByZero
        case missingOperator
    }
    // MARK: Proprities
    var expressionIsCorrect: Bool {
        return operators.count < operands.count
    }

    var expressionHaveEnoughElement: Bool {
        guard operators.count == operands.count - 1 else { return false }
        return operators.count >= 1 && operands.count >= 2
    }

    var calculIsPossible: Bool {
        guard operators.contains("/") else { return true }
            let index = operators.firstIndex(of: "/")!
            let right = operands[index + 1]
            return right != 0
    }

    private var operators = [String]()
    private var operands = [Double]()
    private var result: Double = 0

    private var isAPriorityOperator: Bool {
        for usedOperator in operators {
            if usedOperator == "*" || usedOperator == "/"{
                return true
            }
        }
        return false
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
        priorityCalcul()
        while expressionHaveEnoughElement {
            let index = 0
            let left = operands[index]
            let right = operands[index + 1]
            let usedOperator = operators[index]

            switch usedOperator {
            case "+":
                result = additionCalcul(left: left, right: right)
            case "-":
                result = substractionCalcul(left: left, right: right)
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

    private func divisionCalcul(left: Double, right: Double) throws -> Double {
        guard right != 0 else { throw CalculatorError.divideByZero }
            return left / right
    }

    private func multiplicationcalcul(left: Double, right: Double) -> Double {
        return left * right
    }

    private func priorityCalcul() {
        if expressionHaveEnoughElement {
            while isAPriorityOperator == true {
                for usedOperator in operators {
                    if usedOperator == "*" || usedOperator == "/" {
                        if let index = operators.firstIndex(of: usedOperator) {
                            let left = operands[index]
                            let right = operands[index + 1]
                            let usedPriorityOperator = operators[index]

                            switch usedPriorityOperator {
                            case "*":
                                result = multiplicationcalcul(left: left, right: right)
                            case "/":
                                do {
                                  try result = divisionCalcul(left: left, right: right)
                                } catch CalculatorError.divideByZero {
                                   print("impossible to divide by zéro")
                                } catch {
                                    print("Erreur")
                                }
                            default:
                                break
                            }
                            operands.remove(at: index)
                            operands.remove(at: index)
                            operators.remove(at: index)
                            operands.insert(result, at: index)
                        }
                    }
                }
            }
        }
    }
}

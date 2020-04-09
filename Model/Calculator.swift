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
    var calculNumber = [Int]()

    var calculElements = [String]()

    var isAPriorityOperator: Bool {
        for usedOperator in operators {
            if usedOperator == "*" || usedOperator == "/"{
                return true
            }
        }
        return false
    }

    var result = 0

    func addNewNumber(_ newNumber: Int) {
        calculNumber.append(newNumber)
        calculElements.append(String(newNumber))
    }

    func addOperator(_ newOperator: String) {
        operators.append(newOperator)
        calculElements.append(newOperator)
    }

    func calcul() -> Int {
        priorityCalculTestWithTwoArray()
        while calculNumber.count >= 2 {
            let left = calculNumber[0]
            let right = calculNumber [1]
            let usedOperator = operators[0]

            switch usedOperator {
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
            calculNumber.removeFirst()
            calculNumber.removeFirst()
            operators.removeFirst()
            calculNumber.insert(result, at: 0)
        }
        return result
    }

    func testCalcul() -> Int {
        priorityCalculTestWithOneArray()
        while calculElements.count >= 3 {
            let left = Int(calculElements[0])
            let usedOperator = calculElements[1]
            let right = Int(calculElements[2])

            switch usedOperator {
            case "+":
                result = additionCalcul(left: left!, right: right!)
            case "-":
                result = substractionCalcul(left: left!, right: right!)
            case "/":
                result = divisionCalcul(left: left!, right: right!)
            case "*":
                result = multiplicationcalcul(left: left!, right: right!)
            default:
                break
            }
            calculElements.removeFirst()
            calculElements.removeFirst()
            calculElements.removeFirst()
            calculElements.insert(String(result), at: 0)
        }
        return result
    }

    func clear() {
        calculNumber.removeAll()
        operators.removeAll()
    }

    func priorityCalculTestWithTwoArray() {
        while isAPriorityOperator == true {
            for priorityOperator in operators {
                var usedOperator = priorityOperator
                print("The operator is \(usedOperator)")
                usedOperator.removeFirst()
            }
        }
        print("not priority operator")

    }

    func priorityCalculTestWithOneArray() {
        while isAPriorityOperator == true {
            for usedoperator in calculElements {
                let priorityOperator = usedoperator
                if priorityOperator == "*" || priorityOperator == "/" {
                    print("The operator is \(priorityOperator)")
                    //calculElements.remove(at: priorityOperator)
                }
            }
        }
        print("not priority operator")
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

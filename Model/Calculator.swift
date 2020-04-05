//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nathalie Ortonne on 02/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    var number = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var operators = ["+", "-", "/", "*", "="]
    var result = 0
    var total = 0
    var calculResult = [Int]()

    func manyCalcul() {
        let left = calculResult[0]
        let right = calculResult[1]
        while calculResult.count >= 2 && operators.description != "=" {
            total = calcul(left: left, right: right, with: operators[0] )
        }
    }

    func calcul(left: Int, right: Int, with currentOperator: String) -> Int {
        let operand = currentOperator
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
        calculResult.append(result)
        return result
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

//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nathalie Ortonne on 02/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {

    var number = [Int]()
    var operators = ["+", "-", "="]
    var result = 0

    func calcul(left: Int, right: Int, with currentOperator: String) -> Int {
        if currentOperator == operators[0] {
            result = additionCalcul(left: left, right: right)
        } else if currentOperator == operators[1] {
            result = substractionCalcul(left: left, right: right)
        }
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
}

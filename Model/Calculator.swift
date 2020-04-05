//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nathalie Ortonne on 02/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
var expression = ""
var elements: [String] {
    return expression.split(separator: " ").map { "\($0)" }
}

// Error check computed variables
var expressionIsCorrect: Bool {
    return elements.last != "+" && elements.last != "-"
}

var expressionHaveEnoughElement: Bool {
    return elements.count >= 3
}

var canAddOperator: Bool {
    return elements.last != "+" && elements.last != "-"
}

var expressionHaveResult: Bool {
    return expression.firstIndex(of: "=") != nil
}

func totalCalcul() {

            // Create local copy of operations
            var operationsToReduce = elements

            // Iterate over operations while an operand still here
            while operationsToReduce.count > 1 {
                let left = Int(operationsToReduce[0])!
                let operand = operationsToReduce[1]
                let right = Int(operationsToReduce[2])!

                let result: Int
                switch operand {
                case "+": result = left + right
                case "-": result = left - right
                default: fatalError("Unknown operator !")
                }

                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                operationsToReduce.insert("\(result)", at: 0)
            }

            expression.append(" = \(operationsToReduce.first!)")
        }
}

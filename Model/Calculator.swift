//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nathalie Ortonne on 02/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//


/*
 Hello Mehdi,
 j'ai réfléchi à ma priorisation de calcul, et je patauge un peu...
 je t'ai mis en com les 3 idées qui me sont venu en tête pour mettre en place cette priorisation.
 j'espère que au moins une aura le mérite d'être un début de piste.
 Pour ma part, je pese que la plus simple reste la deuxième solution.

 je te laisse regarder comme ça on peut débriefer demain avec mes débuts de reflexion.
 */
import Foundation

class Calculator {
    var operators = [String]()
    var result = 0
    var calculNumber = [Int]()
    // deuxième solution créer un nouveau tableau string,
    // qui comprend mes nums et mes opérands, pour déplacer un bloc
    // ( l'opérant prioritaire et les nums qui l'englobe)

    func addNewNumber(_ newNumber: Int) {
        calculNumber.append(newNumber)
    }

    func addOperator(_ newOperator: String) {
        // première proposition de priorisation, mais elle ne déplace que l'opérand du coup le calcul reste faux
        // ex 1 + 2 * 5 = 7 au lieu de 11 car lu 1 * 2 + 5
        // du coup il faut réussir à déplacer aussi les nums qui l'englobe
        if newOperator == "*" || newOperator == "/" {
            operators.insert(newOperator, at: 0)
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
            case "*":
                total = multiplicationcalcul(left: left, right: right)
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
        // troisième idée une fonction qui renvois true si l'opérant est * ou / et qui force le début du calul
        // par le prioritaire.
        // mais je vois pas trop comment la construire dans ce cas
        // peut-être créer une variable calculable qui renvoi un bool elle aussi en début de piste
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

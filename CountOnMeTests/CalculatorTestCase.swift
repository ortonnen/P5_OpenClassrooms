//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by Nathalie Ortonne on 04/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@ testable import CountOnMe

class CalculatorTestCase: XCTestCase {
    var calculator: Calculator!

    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    func testGivenStarOperation_WhenAddNewNumber_ThenCalculIsPossible() {
        calculator.addOperand(5)
        calculator.addOperator("+")
        calculator.addOperand(10)
        calculator.addOperator("=")

        XCTAssertEqual(calculator.calcul(), 15)
    }

    func testGivenStarOpertion_WhenOperatorIsMultiply_ThenCalculIsCorrect() {
        calculator.addOperand(2)
        calculator.addOperator("*")
        calculator.addOperand(2)

        XCTAssertEqual(calculator.calcul(), 4)
    }

    func testGivenStarOperationWithCalculFunc_WhenPriorityCalculation_ThenCalculIsPossible() {
        calculator.addOperand(20)
        calculator.addOperator("+")
        calculator.addOperand(5)
        calculator.addOperator("*")
        calculator.addOperand(4)
        calculator.addOperator("/")
        calculator.addOperand(2)
        calculator.addOperator("-")
        calculator.addOperand(12)

        XCTAssertEqual(calculator.calcul(), 18)
    }

    func testGivenMakeManyCalcul_WhenFirstIsOver_ThenSecondCalculStart() {
        var firstCalcul = 0.0
        var secondCalcul = 0.0
        calculator.addOperand(2)
        calculator.addOperator("*")
        calculator.addOperand(2)
        calculator.addOperator("=")

        firstCalcul = calculator.calcul()
        calculator.clear()

        calculator.addOperand(firstCalcul)
        calculator.addOperator("/")
        calculator.addOperand(2)
        calculator.addOperator("=")

        secondCalcul = calculator.calcul()

        XCTAssertEqual(firstCalcul, 4)
        XCTAssertEqual(secondCalcul, 2)
    }

    func testGivenStarCalcul_WhenDivideByZeroAtSecondOperand_ThenCalculIsImpossible() {
        calculator.addOperand(10)
        calculator.addOperand(0)
        calculator.addOperator("/")

        XCTAssertFalse(calculator.calculIsPossible)
        XCTAssertEqual(calculator.calcul(), -9999)
    }

    func testGivenStarCalcul_WhenDivideByZeroAtFirstOperand_ThenCalculIsImpossible() {
        calculator.addOperand(0)
        calculator.addOperand(10)
        calculator.addOperator("/")

        XCTAssertFalse(calculator.calculIsPossible)
        XCTAssertEqual(calculator.calcul(), -9999)
    }

    func testGivenStarCalcul_WhenWithoutZero_ThenCalculIsImpossible() {
        calculator.addOperand(10)
        calculator.addOperand(2)
        calculator.addOperator("/")

        XCTAssertTrue(calculator.calculIsPossible)
        XCTAssertEqual(calculator.calcul(), 5)
    }

    func testGivenStarCalcul_WhenMissingAnOperator_ThenCalculIsImpossible() {
        calculator.addOperand(12)
        calculator.addOperand(6)

        XCTAssertFalse(calculator.expressionIsCorrect)
    }

    func testGivenStartCalcul_WhenExtraOperator_ThenCalculIsImpossible() {
        calculator.addOperand(12)
        calculator.addOperand(6)
        calculator.addOperator("/")
        calculator.addOperator("+")

        XCTAssertFalse(calculator.expressionIsCorrect)
    }

    func testGivenStartCalcul_WhenMissingAnOperand_ThenCalculIsImpossible() {
           calculator.addOperand(12)
           calculator.addOperator("+")

           XCTAssertFalse(calculator.expressionIsCorrect)
       }

    func testGivenStartCalcul_WhenExtraOperand_ThenCalculIsImpossible() {
        calculator.addOperand(12)
        calculator.addOperand(6)
        calculator.addOperand(3)
        calculator.addOperator("+")

        XCTAssertFalse(calculator.expressionIsCorrect)
    }
}

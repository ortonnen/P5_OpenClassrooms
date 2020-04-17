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

        XCTAssertEqual(try calculator.calcul(), 15)
    }

    func testGivenStarOpertion_WhenOperatorIsMultiply_ThenCalculIsCorrect() {
        calculator.addOperand(2)
        calculator.addOperator("*")
        calculator.addOperand(2)

        XCTAssertEqual(try calculator.calcul(), 4)
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

        XCTAssertEqual(try calculator.calcul(), 18)
    }

    func testGivenMakeManyCalcul_WhenFirstIsOver_ThenSecondCalculStart() {
        var firstCalcul: Double?
        var secondCalcul: Double?
        calculator.addOperand(2)
        calculator.addOperator("*")
        calculator.addOperand(2)

        firstCalcul = try? calculator.calcul()
        calculator.clear()

        calculator.addOperand(firstCalcul ?? 0)
        calculator.addOperator("/")
        calculator.addOperand(2)

        secondCalcul = try? calculator.calcul()

        XCTAssertEqual(firstCalcul, 4)
        XCTAssertEqual(secondCalcul, 2)
    }

   func testGivenStarCalcul_WhenDivideByZeroAtSecondOperand_ThenCalculIsImpossible() {
        calculator.addOperand(10)
        calculator.addOperator("/")
        calculator.addOperand(0)

        XCTAssertFalse(calculator.calculIsPossible)
        XCTAssertThrowsError(try calculator.calcul())
    }

    func testGivenStarCalcul_WhenDivideByZeroAtFirstOperand_ThenCalculIsPossible() {
        calculator.addOperand(0)
        calculator.addOperator("/")
        calculator.addOperand(10)

        XCTAssertTrue(calculator.calculIsPossible)
        XCTAssertEqual(try calculator.calcul(), 0)
    }

    func testGivenStarCalcul_WhenWithoutZero_ThenCalculIsImpossible() {
        calculator.addOperand(10)
        calculator.addOperator("/")
        calculator.addOperand(2)

        XCTAssertTrue(calculator.calculIsPossible)
        XCTAssertEqual(try calculator.calcul(), 5)
    }

    func testGivenStarCalcul_WhenMissingAnOperator_ThenCalculIsImpossible() {
        calculator.addOperand(12)
        calculator.addOperand(6)

        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertFalse(calculator.expressionHaveEnoughElement)
    }

    func testGivenStartCalcul_WhenExtraOperator_ThenCalculIsImpossible() {
        calculator.addOperand(12)
        calculator.addOperator("/")
        calculator.addOperand(6)
        calculator.addOperator("+")

        XCTAssertFalse(calculator.expressionIsCorrect)
        XCTAssertFalse(calculator.expressionHaveEnoughElement)
    }

    func testGivenStartCalcul_WhenMissingAnOperand_ThenCalculIsImpossible() {
        calculator.addOperand(12)
        calculator.addOperator("+")

        XCTAssertFalse(calculator.expressionIsCorrect)
        XCTAssertFalse(calculator.expressionHaveEnoughElement)
    }

    func testGivenStartCalcul_WhenExtraOperand_ThenCalculIsImpossible() {
        calculator.addOperand(12)
        calculator.addOperator("+")
        calculator.addOperand(6)
        calculator.addOperand(3)

        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertFalse(calculator.expressionHaveEnoughElement)
    }
}

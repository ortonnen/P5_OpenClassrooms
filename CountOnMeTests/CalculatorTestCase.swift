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
        calculator.addNewNumber(5)
        calculator.addOperator("+")
        calculator.addNewNumber(10)
        calculator.addOperator("=")

        XCTAssertEqual(calculator.calcul(), 15)
    }

    func testGivenStarOpertion_WhenOperatorIsMultiply_ThenCalculIsCorrect() {
        calculator.addNewNumber(2)
        calculator.addOperator("*")
        calculator.addNewNumber(2)

        XCTAssertEqual(calculator.calcul(), 4)
    }

    func testGivenStarOperationWithCalculFunc_WhenPriorityCalculation_ThenCalculIsPossible() {
        calculator.addNewNumber(20)
        calculator.addOperator("+")
        calculator.addNewNumber(5)
        calculator.addOperator("*")
        calculator.addNewNumber(4)
        calculator.addOperator("/")
        calculator.addNewNumber(2)
        calculator.addOperator("-")
        calculator.addNewNumber(12)

        XCTAssertEqual(calculator.calcul(), 18)
    }

    func testGivenMakeManyCalcul_WhenFirstIsOver_ThenSecondCalculStart() {
        var firstCalcul = 0
        var secondCalcul = 0
        calculator.addNewNumber(2)
        calculator.addOperator("*")
        calculator.addNewNumber(2)
        calculator.addOperator("=")

        firstCalcul = calculator.calcul()
        calculator.clear()

        calculator.addNewNumber(firstCalcul)
        calculator.addOperator("/")
        calculator.addNewNumber(2)
        calculator.addOperator("=")

        secondCalcul = calculator.calcul()

        XCTAssertEqual(firstCalcul, 4)
        XCTAssertEqual(secondCalcul, 2)
    }

    func testGivenUseOperator_WhenOperatorIsMultiplyOrDivide_ThenOperatorIsPrioritaire() {
        //definir opérator prioritaire
        calculator.addOperator("+")
        calculator.addOperator("-")
        calculator.addOperator("*")

        XCTAssertEqual(calculator.isAPriorityOperator, true)
    }

    func testGivenUseOperator_WhenOperatorIsMinusOrPlus_ThenOperatorIsNotPrioritaire() {
        //definir opérator prioritaire
        calculator.addOperator("+")
        calculator.addOperator("-")
        calculator.addOperator("+")

        XCTAssertEqual(calculator.isAPriorityOperator, false)
    }
}

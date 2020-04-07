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

    func testGivenStarOperation_WhenNoPriorityCalculation_ThenCalculIsPossible() {
        calculator.addNewNumber(2)
        calculator.addOperator("+")
        calculator.addNewNumber(2)
        calculator.addOperator("*")
        calculator.addNewNumber(3)
        calculator.addOperator("=")

        XCTAssertEqual(calculator.calcul(), 12)
    }

    func testGivenStarOpertion_WhenDivision_ThenCalculIsCorrect() {
        calculator.addNewNumber(2)
        calculator.addOperator("*")
        calculator.addNewNumber(2)

        XCTAssertEqual(calculator.calcul(), 4)

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

    func testGivenStartCalculWithManyOperator_WhenOperatorHasPriority_ThenCalculStartWithThis() {
        calculator.addNewNumber(10)
        calculator.addOperator("+")
        calculator.addNewNumber(5)
        calculator.addOperator("*")
        calculator.addNewNumber(2)

        XCTAssertEqual(calculator.calcul(), 20)
    }

}

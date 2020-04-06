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

    func testGivenStartOperation_WhenMakeAllCalcul_ThenAllResultIsPossible() {
        let add = calculator.additionCalcul(left: 3, right: 3)
        let sub = calculator.substractionCalcul(left: add, right: 4)
        let div = calculator.divisionCalcul(left: add, right: sub)
        let mul = calculator.multiplicationcalcul(left: div, right: sub)

        XCTAssertEqual(add, 6)
        XCTAssertEqual(sub, 2)
        XCTAssertEqual(div, 3)
        XCTAssertEqual(mul, 6)
    }

    func testGivenStarOperation_WhenAddNewNumber_ThenCalculIsPossible() {
        calculator.addNewNumber(5)
        calculator.addNewNumber(10)
        calculator.addOperator("+")

        calculator.calcul()

        XCTAssertEqual(calculator.result, 15)
    }
}

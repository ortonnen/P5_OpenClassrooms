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

    func testGivenStartOperation_WhenMakeAddition_ThenAdditionLeftAndRight() {
        var result = calculator.result

       result = calculator.calcul(left: 3, right: 2, with: "+")

        XCTAssertEqual(result, 5)
    }

    func testGivenStartOperation_WhenMakeSubstarction_ThenSubstractLeftAndRight() {
        var result = calculator.result

        result = calculator.calcul(left: 3, right: 2, with: "-")

        XCTAssertEqual(result, 1)
    }

}

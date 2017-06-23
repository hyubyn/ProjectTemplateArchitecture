//
//  Utils.swift
//  ProjectTemplate
//
//  Created by NguyenVuHuy on 6/22/17.
//  Copyright © 2017 Gianty. All rights reserved.
//
//  Define functions helper

import UIKit

class Utils {
    static let shared = Utils()
    
    /*
        A function, that swap two number
        @param firstNumber: type Float
        @param sencondNumber: type Float
        Output: 2 swapped number
    */
    func swapValue(firstNumber: inout Float, secondNumber: inout Float) {
        firstNumber = firstNumber + secondNumber
        secondNumber = firstNumber - secondNumber
        firstNumber = firstNumber - secondNumber
    }
    
}

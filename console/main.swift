//
//  main.swift
//  console
//
//  Created by Roman Alikevich on 15.06.2021.
//

import Foundation


class FunctionCalculate {
    private var a: Double = 0.0
    private var b: Double = 0.0
    private var c: Double = 0.0
    
    func addFunctionParam(paramName: String) {
        var flag = true
        while flag {
            print("Enter param \(paramName)")
            if let point = readLine() {
                let buff = Double(point) ?? nil
                if buff == nil {
                    print("Incorrect number")
                    continue
                }
                initParam(name: paramName, value: buff!)
                flag = false
            } else {
                print("Incorrect number")
            }
        }
    }
    
    func initParam(name: String, value: Double) {
        if name == "a" {
            a = value
        } else if name == "b" {
            b = value
        } else {
            c = value
        }
    }
    
    func calculateDiscriminant() -> Double {
        return pow(b, 2) - 4 * a * c
    }

    func getFunctionRoots() -> (Double, Double) {
        return (((-1) * b + calculateDiscriminant()) / 2 * a, ((-1) * b - calculateDiscriminant()) / 2 * a)
    }

}
var flag = true
var functionCalculate = FunctionCalculate()
while flag {
    
    functionCalculate.addFunctionParam(paramName: "a")
    functionCalculate.addFunctionParam(paramName: "b")
    functionCalculate.addFunctionParam(paramName: "c")

    let discriminant = functionCalculate.calculateDiscriminant()
    print("discriminant: \(discriminant)")
    if discriminant >= 0 {
        print("x1 = \(functionCalculate.getFunctionRoots().0)")
        print("x2 = \(functionCalculate.getFunctionRoots().1)")
    } else {
        print("There aren't roots")
    }
    
    print("Would you like to close app?(y/n)")
    if let answer = readLine() {
        if answer == "y" {
            flag = false
        }
    }
}


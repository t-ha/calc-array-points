//
//  main.swift
//  CalcArrayPoints
//
//  Created by MAIN on 10.11.16.
//  Copyright © 2016 University of Washington. All rights reserved.
//

import Foundation

// Calc

func add(numOne: Int, numTwo: Int) -> Int {
    return numOne + numTwo
}

func subtract(numOne: Int, numTwo: Int) -> Int {
    return numOne - numTwo
}

func multiply(numOne: Int, numTwo: Int) -> Int {
    return numOne * numTwo
}

// DECIMAL division
func divide(numOne: Int, numTwo: Int) -> Float {
    return Float(numOne) / Float(numTwo)
}

func calculate<T>(op: (Int, Int) -> T, numOne: Int, numTwo: Int) -> T {
    return op(numOne, numTwo)
}


// Array

func add(nums: [Int]) -> Int {
    return nums.reduce(0, +)
}

func multiply(nums: [Int]) -> Int {
    return nums.reduce(1, *)
}

func count(nums: [Int]) -> Int {
    return nums.count
}

func avg(nums: [Int]) -> Double {
    return Double(add(nums: nums)) / Double(count(nums: nums))
}

func calculate<T>(op: ([Int]) -> T, nums: [Int]) -> T {
    return op(nums)
}


// Points (tuples)
func add(p1: (Int, Int), p2: (Int, Int)) -> (Int, Int) {
    return (p1.0 + p2.0, p1.1 + p2.1)
}

func subtract(p1: (Int, Int), p2: (Int, Int)) -> (Int, Int) {
    return (p1.0 - p2.0, p1.1 - p2.1)
}

// non-two-arity
//func add(p1: (?), p2: (?)) -> (?) {
//    cant iterate over tuple or pass in tuples of varying sizes to my knowledge
//      unless changes are made before the function is called
//}



// Points (dictionary)
func add(p1: Dictionary<String, Int>, p2: Dictionary<String, Int>) -> (Int, Int) {
    return (p1["x"]! + p2["x"]!, p1["y"]! + p2["y"]!)
}
func subtract(p1: Dictionary<String, Int>, p2: Dictionary<String, Int>) -> (Int, Int) {
    return (p1["x"]! - p2["x"]!, p1["y"]! - p2["y"]!)
}

// without "x" or "y". compiles but ..
//func add(p1: Dictionary<String, Int>? = nil, p2: Dictionary<String, Int>? = nil) -> (Int, Int)? {
//    if p1 != nil && p2 != nil {
//        return (p1!["x"]! + p2!["x"]!, p1!["y"]! + p2!["y"]!)
//    } else {
//        return nil
//    }
//}
//func subtract(p1: Dictionary<String, Int>? = nil, p2: Dictionary<String, Int>? = nil) -> (Int, Int)? {
//    if p1 != nil && p2 != nil {
//        return (p1!["x"]! - p2!["x"]!, p1!["y"]! - p2!["y"]!)
//    } else {
//        return nil
//    }
//}
//print(add(p1: d1, p2: nil))



// handles Doubles/Floats/Int
protocol NumericType {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
}

extension Double : NumericType {}
extension Float  : NumericType {}
extension Int    : NumericType {}

func add<T: NumericType>(p1: Dictionary<String, T>, p2: Dictionary<String, T>) -> (T, T) {
    return (p1["x"]! + p2["x"]!, p1["y"]! + p2["y"]!)
}
func subtract<T: NumericType>(p1: Dictionary<String, T>, p2: Dictionary<String, T>) -> (T, T) {
    return (p1["x"]! - p2["x"]!, p1["y"]! - p2["y"]!)
}

var d1 = ["x": 1.1, "y": 2.3]
var d2 = ["x": 3.9, "y": 6.3]

print(add(p1: d1, p2: d2))

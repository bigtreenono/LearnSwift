//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

2+6

27 / 7.0

let exercises = 11

var exercisesSolved = 0

let actuallyDouble = 3 as Double

let count = 10
var sum = 1
var lastSum = 0
for _ in 0..<count {
    let temp = sum
    sum = sum + lastSum
    lastSum = temp
}
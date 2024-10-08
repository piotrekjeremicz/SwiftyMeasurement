//
//  main.swift
//
//
//  Created by Piotrek Jeremicz on 03.09.2024.
//

import Core

Measure.the("Higher Order Functions - Maps Comparison")

struct Lottery {
    let draw: [Int]
}

let lottery = [
    Lottery(draw: [3, 5, 12, 34, 46, 52]),
    Lottery(draw: [2, 6, 11, 13, 24, 46]),
    Lottery(draw: [5, 7, 19, 33, 34, 45])
]

measure("map") {
    lottery.map { $0.draw }
}

measure("flatMap") {
    lottery.flatMap { $0.draw }
}

measure("compactMap") {
    lottery.compactMap { $0.draw }
}

Measure.run()

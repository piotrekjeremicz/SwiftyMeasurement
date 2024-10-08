//
//  Untitled.swift
//  Swifty Measurement
//
//  Created by Piotrek Jeremicz on 24.09.2024.
//

import Core

Measure.the("Unwrapping Optionals", repeats: 400_000)

let some: Optional<Int> = 1

measure("Forced Unwrapping") {
    let _ = some!
}

measure("Optional Binding - if let") {
    if let some { let _ = some }
}

measure("Optional Binding - guard let") {
    guard let some else { return }
    let _ = some
}

measure("Nil-Coalescing Operator") {
    let _ = some ?? 0
}

measure("Optional Chaining") {
    let _ = some?.description
}

measure("Implicitly Unwrapped Optionals") {
    let _: Int! = some
}

measure("Pattern Matching") {
    switch some {
    case let .some(value):
        let _ = value
    case .none:
        break
    }
}

Measure.run(attempts: 100)

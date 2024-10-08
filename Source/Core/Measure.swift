//
//  Measure.swift
//  Swifty Measurement
//
//  Created by Piotrek Jeremicz on 31.08.2024.
//

import Foundation

public typealias Block = () -> Void
public typealias Inputs = [(name: String, block: Block)]
public typealias Results = [String: TimeInterval]

public class Measure {
    let title: String
    let repeats: Int
    
    var inputs: Inputs
    var results: Results
    
    public init(_ title: String = "", repeats: Int = 100_000) {
        self.title = title
        self.inputs = []
        self.results = [:]
        self.repeats = repeats
    }
    
    static var shared = Measure()
    
    public static func the(_ title: String, repeats: Int = 100_000) {
        shared = Measure(title, repeats: repeats)
    }
    
    public static func run(attempts: Int = 10) {
        for _ in 0..<attempts {
            for input in Measure.shared.inputs {
                let start = CFAbsoluteTimeGetCurrent()
                
                for _ in 0..<Measure.shared.repeats {
                    input.block()
                }
                
                let timeInterval = (CFAbsoluteTimeGetCurrent() - start) * 1000
                
                if let result = Measure.shared.results[input.name] {
                    Measure.shared.results[input.name] = (result + timeInterval)/2
                } else {
                    Measure.shared.results[input.name] = timeInterval
                }
            }
        }
        
        Measure.shared.describeResults(for: attempts)
    }
    
    func describeResults(for attempts: Int) {
        print("Measure the \(title)")
        print("attempts: \(attempts), repeats: \(Measure.shared.repeats)")
        let bestResult = results.values.min() ?? 0
        let longestTitle = results.keys.sorted(by: { $0.count < $1.count }).last ?? ""
        
        results = results.mapValues { $0 / bestResult }
        
        var index = 1
        for (title, ratio) in results.sorted(by: { $0.value < $1.value }) {
            let seconds = ratio * bestResult
            let precentRation = (ratio - 1) * 100
            
            let spacerLength = longestTitle.count - title.count
            let titleColumn = title + String(repeating: " ", count: spacerLength)
            
            let dotsLength = Int(ratio * 10)
            let dotsIndicator = String(repeating: ".", count: dotsLength)
            
            print(String(format: "%i. %@ | %6.2f ms | +%3.0f%% | %@", index, titleColumn, seconds, precentRation, dotsIndicator))
            
            index += 1
        }
        
        print("\n")
    }
}

public func measure(_ name: String, block: @escaping Block) {
    Measure.shared.inputs.append((name, block))
}

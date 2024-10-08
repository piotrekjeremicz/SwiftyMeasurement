//
//  main.swift
//
//
//  Created by Piotrek Jeremicz on 03.09.2024.
//

import Core
import Foundation

Measure.the("Higher Order Functions - Compact Map")

struct Message {
    let text: String
    let author: UUID
    let attachment: Data?
}

let messages = [
    Message(text: "Hi!", author: .init(), attachment: nil),
    Message(text: "How are you?", author: .init(), attachment: nil),
    Message(text: "Great!", author: .init(), attachment: Data()),
    Message(text: "Good day!", author: .init(), attachment: nil)
]

measure("Control Flow method") {
    var attachments = [Data]()
    
    for message in messages {
        if let attachment = message.attachment {
            attachments.append(attachment)
        }
    }
}

measure("Closure parameter") {
    let _ = messages.compactMap { message in message.attachment }
}

measure("Shorthand argument") {
    let _ = messages.compactMap { $0.attachment }
}

measure("Key Path") {
    let _ = messages.compactMap(\.attachment)
}

Measure.run()


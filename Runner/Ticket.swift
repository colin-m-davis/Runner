//
//  Ticket.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import Foundation

struct Ticket {
    internal let issued = Date() // issued is always equal to the time the Ticket struct was initialized
    internal var number : Int
    internal var name : String
    internal var make : String
    internal var model : String
    internal var color : String
    
    init(number: Int = -1, name: String="", make: String="", model: String="", color: String="") {
        self.number = number
        self.name = name
        self.make = make
        self.model = model
        self.color = color
    }
    
    
}

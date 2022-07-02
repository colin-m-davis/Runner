//
//  Ticket.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Ticket: Codable {
    @DocumentID internal var id : String? = UUID().uuidString
    internal var issued : Timestamp = Timestamp()
    internal var number : Int = -1
    internal var name : String = ""
    internal var make : String = ""
    internal var model : String = ""
    internal var color : String = ""
}

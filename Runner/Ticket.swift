//
//  Ticket.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

// TODO - Rearrange, add, delete fields
struct Ticket: Codable, Identifiable {
    @DocumentID var id : String? = UUID().uuidString
    var issued : Timestamp = Timestamp()
    var number : String = ""
    var name : String = ""
    var room : String = ""
    var departure : String = ""
    var event : String = ""
    var make : String = ""
    var model : String = ""
    var color : String = ""
}

//
//  StorageManager.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import Foundation
import FirebaseFirestore

class FirestoreManager : ObservableObject {
    
    // Creates /users/uid/tickets and adds a "base" ticket
    func createUserDoc(uid: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid).collection("tickets").document()
        docRef.setData([
            "name": "",
            "number": -1,
            "issue_date": Timestamp(),
            "make": "",
            "model": "",
            "color": "",
        ])
    }
    
    func addTicket() {
        
    }

}

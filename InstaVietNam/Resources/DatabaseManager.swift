//
//  DatabaseManager.swift
//  InstaVietNam
//
//  Created by Ngọc Thiện on 10/09/2022.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let dattabase = Database.database().reference()
    
    // Mark: - Public
    
    ///Check if username and email is available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    ///Insert new  username data to database
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion: Async callback for result if database succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabasekey()
        dattabase.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                //succeded
                completion(true)
                return
            } else {
                //failed
                completion(false)
                return
            }
        }
    }
}

//
//  SignupViewModel.swift
//  Name Suggestor
//
//  Created by NPNAM on 13/09/2022.
//

import Foundation
import CoreData

final class Controller: ObservableObject {
    
    let container = NSPersistentContainer(name: "Name_Suggestor")
    @Published var alertItem: AlertItem?
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
    }
        
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addUser(name: String, pass: String, email: String) {
        if checkUserCanRegister(name: name, pass: pass, email: email) == true {
            let u = UserInfo(context: container.viewContext)
            u.username = name
            u.email = email
            u.password = pass
            save(context: container.viewContext)
            alertItem = AlertContext.registerSuccess
        } else {
            print("Fail")
        }
    }
    
    func checkUserCanRegister(name: String, pass: String, email: String) -> Bool {
        if name == "" {
            alertItem = AlertContext.userNameMissing
            return false
        }
        
        if email == "" {
            alertItem = AlertContext.emailMissing
            return false
        }
        
        if isValidEmail(email: email) == false {
            alertItem = AlertContext.emailNotValid
            return false
        }
        
        if pass == "" {
            alertItem = AlertContext.passwordMissing
            return false
        }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
        do {
            let listU = try container.viewContext.fetch(fetchRequest) as? [UserInfo]
            if listU?.contains(where: {$0.username == name || $0.email == email }) == true {
                alertItem = AlertContext.emailOrUserNameExist
                return false
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return true
    }
    
    func checkUserCanLogin(name: String, pass: String) {
        if name == "" {
            alertItem = AlertContext.userNameMissing
            return
        }
        
        if pass == "" {
            alertItem = AlertContext.passwordMissing
            return
        }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
        do {
            let listU = try container.viewContext.fetch(fetchRequest) as? [UserInfo]
            if listU?.contains(where: {$0.username == name && $0.password == pass }) == true {
                alertItem = AlertContext.loginSuccess
                return
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        alertItem = AlertContext.loginFail
    }
    
    func isValidEmail(email: String) -> Bool {
        let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        return email.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

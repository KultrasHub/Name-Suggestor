/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Nguyen Phan Nam
  ID: s3873792
  Created  date: 15/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI


struct AlertItem: Identifiable {
    let id: Int
    let title: Text
    let message: Text
    let buttonTitle: Text
    
}

struct AlertContext {
    static let userNameMissing = AlertItem(id: 0, title: Text("Error"),
                                    message: Text("User name cannot be empty"),
                                    buttonTitle: Text("OKAY"))
    
    static let passwordMissing = AlertItem(id: 1, title: Text("Error"),
                                    message: Text("Password cannot be empty"),
                                    buttonTitle: Text("OKAY"))
    
    static let emailMissing = AlertItem(id: 2, title: Text("Error"),
                                    message: Text("Email cannot be empty"),
                                    buttonTitle: Text("OKAY"))
    
    static let emailOrUserNameExist = AlertItem(id: 3, title: Text("Error"),
                                    message: Text("User name or Email registered"),
                                    buttonTitle: Text("OKAY"))
    
    static let emailNotValid = AlertItem(id: 4, title: Text("Error"),
                                    message: Text("Email not valid"),
                                    buttonTitle: Text("OKAY"))
    
    static let registerSuccess = AlertItem(id: 5, title: Text("Success"),
                                    message: Text("Resgiter Success"),
                                    buttonTitle: Text("Go to Login"))
    
    static let loginSuccess = AlertItem(id: 6, title: Text("Success"),
                                    message: Text("Login Success"),
                                    buttonTitle: Text("OKAY"))
    static let loginFail = AlertItem(id: 7, title: Text("Error"),
                                    message: Text("User name or password incorrect"),
                                    buttonTitle: Text("OKAY"))
}

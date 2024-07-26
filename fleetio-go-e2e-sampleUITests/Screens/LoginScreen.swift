//
//  Login.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-23.
//

import Foundation
import XCTest

/// Login  screen data representation
enum LoginScreen: String, ApplicationAccessing {
    
    case emailField = "email_text_field"
    case passwordField = "password_text_field"
    case loginButton = "login_button"
    
    var element: XCUIElement {
        switch self {
        case .emailField:
            return app.textFields[rawValue]
        case .passwordField:
            return app.secureTextFields[rawValue]
        case .loginButton:
            return app.buttons[rawValue]
        }
    }
}

/// Login screen actions representation
class LoginScreenActions: ElementWaitable, TextFieldActionable {
    
    @discardableResult
    func iTapLoginButton() -> Self {
        iWaitForElementAndTap(LoginScreen.emailField.element)
        return self
    }
    
    @discardableResult
    func iLogin(email:  String, password: String) -> Self {
        iType(text: email, inTextField: LoginScreen.emailField.element)
        iType(text: password, inTextField: LoginScreen.passwordField.element)
        iWaitForElementAndTap(LoginScreen.loginButton.element)
        return self
    }
}

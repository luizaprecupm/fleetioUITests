//
//  SelectFuelTypeScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-25.
//

import Foundation
import XCTest


/// SelectFuelTypeScreen  data representation
enum SelectFuelTypeScreen: String, ApplicationAccessing {
    
    case fuelFlex = "Flex Fuel"
    case doneButton = "Done"
    
    var element: XCUIElement {
        switch self {
        case .fuelFlex:
            return app.staticTexts[rawValue]
        case .doneButton:
            return app.buttons[rawValue]
        }
    }
}

///// SelectFuelTypeScreen actions representation
class SelectFuelTypeScreenActions: ElementWaitable, Scrollable {
    
    @discardableResult
    func iSelectFuelType(fuelType: SelectFuelTypeScreen) -> Self {
        scrollDownUntilElementExists(fuelType.element)
        iWaitForElementAndTap(fuelType.element)
        return self
    }
    @discardableResult
    func iTapDoneButton() -> Self {
        iWaitForElementAndTap(SelectFuelTypeScreen.doneButton.element)
        return self
    }
}

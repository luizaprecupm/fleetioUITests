//
//  HomeScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-22.
//

import XCTest
import Foundation

/// Home  screen data representation
enum HomeScreen: String, ApplicationAccessing, CaseIterable {
    
    case fleetioLogo = "fleetio-logo"
    case homeTab = "Home"
    case browseTab = "browse_tab"
    case notificationsTab = "Notifications"
    case searchTab = "Search"
    
    var element: XCUIElement {
        switch self {
        case .fleetioLogo:
            return app.icons[rawValue]
        case .homeTab, .browseTab, .notificationsTab, .searchTab:
            return app.buttons[rawValue]
        }
    }
}

///// Home screen actions representation
class HomeScreenActions: ElementWaitable {
    
    @discardableResult
    func iTapBrowseTab() -> Self {
        iWaitForElementAndTap(HomeScreen.browseTab.element)
        return self
    }
}


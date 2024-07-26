//
//  LoginTest.swift
//  fleetio-go-e2e-sample
//
//  Created by Luiza on 2024-07-22.
//

import XCTest
import Foundation

final class CreateANewFuelEntryTest: UITest {
    
    func test_iLoginAndCreateANewFuelEntry() {
        
        LoginScreenActions()
            .iLogin(email: Utils.defaultEmail, password: Utils.defaultPassword)
        HomeScreenActions()
            .iTapBrowseTab()
        BrowseScreenActions()
            .iTapVehiclesButton()
        TypesOfVehiclesScreenActions()
            .iSelectTypeOfVehicle(vehicleType: .electricDream)
        VehicleDetailsScreenActions()
            .iTapFuelLog()
        FuelLogListScreenActions()
            .iTapAddNewFuel()
        AddNewFuelFormScreenActions()
            .iAddNewFuelEntry(fuelType: .fuelFlex, pricePerGallon: Utils.pricePerGallon, gallons: Utils.gallons, tripMiles: Utils.tripMiles, odometer: Utils.odometer)
        FuelLogListScreenActions()
            .iVerifyLastAddedFuelLog(pricePerGallon: Utils.pricePerGallon, gallons: Utils.gallons, tripMiles: Utils.tripMiles, odometer: Utils.odometer)
    }
    
    func test_saveFormWithEmptyFieldsTest() {
        LoginScreenActions()
            .iLogin(email: Utils.defaultEmail, password: Utils.defaultPassword)
        HomeScreenActions()
            .iTapBrowseTab()
        BrowseScreenActions()
            .iTapVehiclesButton()
        TypesOfVehiclesScreenActions()
            .iSelectTypeOfVehicle(vehicleType: .reliable)
        VehicleDetailsScreenActions()
            .iTapFuelLog()
        FuelLogListScreenActions()
            .iTapAddNewFuel()
        AddNewFuelFormScreenActions()
            .iTapSaveButton()
            .iWaitForElement(AddNewFuelFormScreen.errorMessage.element)
    }
}

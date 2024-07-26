//
//  VehicleView.swift
//  fleetio-go-e2e-sample
//
//  Created by Tony Fang on 7/19/24.
//

import Foundation
import SwiftUI

struct VehicleOptions {
  let name: String
  let iconName: String
}

struct VehicleView: View {
  
  @State var vehicle: Vehicle
  
  let vehicleOptions = [
    VehicleOptions(name: "Fuel Log", iconName: "fuelpump"),
    VehicleOptions(name: "Service History", iconName: "wrench.adjustable"),
    VehicleOptions(name: "Work Orders", iconName: "list.clipboard"),
    VehicleOptions(name: "Inspections", iconName: "checklist.checked"),
    VehicleOptions(name: "Installed Tires", iconName: "car.rear.and.tire.marks"),
    VehicleOptions(name: "Issuess", iconName: "exclamationmark.circle"),
    VehicleOptions(name: "Service Reminders", iconName: "alarm.waves.left.and.right"),
    VehicleOptions(name: "Renewal Reminders", iconName: "speedometer"),
    VehicleOptions(name: "Assignment History", iconName: "calendar"),
    VehicleOptions(name: "Meter History", iconName: "speedometer"),
    VehicleOptions(name: "Last Known Location", iconName: "location"),
    VehicleOptions(name: "Comments", iconName: "bubble"),
    VehicleOptions(name: "Photos", iconName: "photo"),
    VehicleOptions(name: "Documents", iconName: "doc")
    ]
  
  var body: some View {
    List {
      Text(vehicle.customName)
      
      Section {
        ForEach(vehicleOptions, id: \.name) { option in
          NavigationLink(destination: navigationDestination(for: option)) {
            HStack {
              Image(systemName: option.iconName)
                .imageScale(.large)
                .foregroundColor(.gray)
                .frame(width: 25, height: 25)
              
              Text(option.name)
                .padding(.leading, 20)
            }
          }
          .accessibilityIdentifier(AccessibilityIdentifiers.VehicleView.vehicleOption(name: option.name))
        }
      }
    }
    .navigationTitle(vehicle.customName)
  }
  
  func navigationDestination(for asset: VehicleOptions) -> some View {
    switch asset.name {
    case "Fuel Log":
      return AnyView(FuelLogList(vehicleId: vehicle.id))
    default:
      return AnyView(Text("Coming soon!"))
    }
  }
}

#Preview {
  NavigationView {
    VehicleView(vehicle: SampleData.vehicleList[0])
  }
}

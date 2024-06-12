//
//  FancyFoodApp.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI

@main
struct FancyFoodApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

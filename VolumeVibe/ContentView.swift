//
//  ContentView.swift
//  VolumeVibe
//
//  Created by 谢泽钰 on 2024/4/14.
//

import AVFoundation
import MediaPlayer
import SwiftUI
import AuthenticationServices

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            NavigationView {
                Home()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView {
                More().navigationBarTitle("More", displayMode: .automatic)
            }
            .tabItem {
                Image(systemName: "gear")
                Text("More")
            }
        }
        
        
    }
}

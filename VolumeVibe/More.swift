//
//  More.swift
//  VolumeVibe
//
//  Created by 谢泽钰 on 2024/4/25.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct More: View {
    
    @State private var showAppStore: Bool = false
    
    @StateObject private var viewModel = VolumeViewModel()
    
    var body: some View {
        
        List {
            
            Section {
                NavigationLink(destination: Accurate().navigationBarTitle("Accurate", displayMode: .inline)) {
                    HStack {
                        Label("Accurate", systemImage: "ruler")
                        Spacer()
                        Text("\(formattedValue(value: 100*Double(viewModel.currentVolume)))").foregroundStyle(.secondary)
                    }
                }
                NavigationLink(destination: Simulation().navigationBarTitle("Simulation", displayMode: .inline)) {
                    Label("Simulation", systemImage: "gauge.with.dots.needle.bottom.0percent")
                }
            }
            
            Section {
                NavigationLink(destination: Settings().navigationBarTitle("Settings", displayMode: .inline)) {
                    Label("Settings", systemImage: "gear")
                }
                NavigationLink(destination: Ratings().navigationBarTitle("Ratings", displayMode: .inline)) {
                    Label("Ratings", systemImage: "trophy")
                }
                NavigationLink(destination: Privacy().navigationBarTitle("Privacy", displayMode: .inline)) {
                    Label("Privacy", systemImage: "hand.raised")
                }
                NavigationLink(destination: About().navigationBarTitle("About", displayMode: .inline)) {
                    Label("About", systemImage: "info.circle")
                }
            }
            
        }
    }
}

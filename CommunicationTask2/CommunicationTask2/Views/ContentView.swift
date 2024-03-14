//
//  ContentView.swift
//  CommunicationTask2
//
//  Created by Samar Assi on 14/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet: Bool = false
    @State var selectedDevice: Device? = nil

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            selectedDeviceDetails
            Spacer()
            Spacer()
            ButtonView(
                buttonText: Text(Constant.ButtonText.CHOOSE_PRODUCT),
                buttonIcon: Image(systemName: "apple.logo"),
                buttonColor: Color("sky_blue"),
                action: {
                    showSheet.toggle()
                }
            )
        }
        .padding(.bottom)
        .padding(.horizontal, 50)
        .sheet(isPresented: $showSheet) {
            PopoverButtonListView(showSheet: $showSheet, selectedDevice: $selectedDevice)
                .presentationDetents([.medium, .large])
        }
    }
}

extension ContentView {
    var selectedDeviceDetails: some View {
        VStack(spacing: 20) {
            if selectedDevice == nil {
                Image(uiImage: UIImage.appleProducts)
                    .resizable()
                Text(Constant.ProductName.APPLE_PRODUCT_LINE)
            } else {
                selectedDevice?.getDeviceImage()
                    .padding(.horizontal, 40)
                selectedDevice?.getDeviceTitle()
            }
        }
        .scaledToFit()
        .fontWeight(.bold)
    }
}

enum Device: String {
    case iPhone = "iPhone 15"
    case iPad = "iPad Air"
    case macBook = "MacBook"
    
    func getDeviceImage() -> Image {
        switch self {
        case .iPhone:
            return Image(uiImage: UIImage.iPhone15).resizable()
        case .iPad:
            return Image(uiImage: UIImage.iPadAir).resizable()
        case .macBook:
            return Image(uiImage: UIImage.macBook).resizable()
        }
    }
    
    func getDeviceTitle() -> Text {
        switch self {
        case .iPhone, .iPad, .macBook:
            return Text(self.rawValue).fontWeight(.bold)
        }
    }
}

#Preview {
    ContentView()
}

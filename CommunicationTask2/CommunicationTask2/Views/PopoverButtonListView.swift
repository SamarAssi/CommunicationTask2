//
//  PopoverButtonListView.swift
//  CommunicationTask2
//
//  Created by Samar Assi on 14/03/2024.
//

import SwiftUI

struct PopoverButtonListView: View {
    @Binding var showSheet: Bool
    @Binding var selectedDevice: Device?
    
    var body: some View {
        VStack(spacing: 20) {
            ButtonView(
                buttonText: Text(Constant.ButtonText.IPHONE),
                buttonIcon: Image(systemName: "iphone.gen2"),
                buttonColor: Color("sky_blue"),
                action: {
                    changeDevice(device: .iPhone)
                }
            )
            
            ButtonView(
                buttonText: Text(Constant.ButtonText.IPAD),
                buttonIcon: Image(systemName: "ipad.gen2"),
                buttonColor: Color("light_green"),
                action: {
                    changeDevice(device: .iPad)
                }
            )

            ButtonView(
                buttonText: Text(Constant.ButtonText.MAC_BOOK_PRO),
                buttonIcon: Image(systemName: "macbook.gen2"),
                buttonColor: Color("violate"),
                action: {
                    changeDevice(device: .macBook)
                }
            )
        }
        .padding(.horizontal, 50)
    }
    
    func changeDevice(device: Device) {
        selectedDevice = device
        showSheet.toggle()
    }
}

#Preview {
    PopoverButtonListView(showSheet: .constant(false), selectedDevice: .constant(nil))
}

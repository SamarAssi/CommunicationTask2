//
//  ButtonView.swift
//  CommunicationTask2
//
//  Created by Samar Assi on 14/03/2024.
//

import SwiftUI

struct ButtonView: View {
    var buttonText: Text
    var buttonIcon: Image
    var buttonColor: Color
    var action: () -> Void

    
    var body: some View {
        Button(action: action) {
            Label {
                buttonText
            } icon: {
                buttonIcon
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(buttonColor.opacity(0.3))
            .foregroundStyle(buttonColor)
            .cornerRadius(10)
            .fontWeight(.bold)
        }
    }
}

#Preview {
    ButtonView(
        buttonText: Text(Constant.ButtonText.CHOOSE_PRODUCT),
        buttonIcon: Image(systemName: "apple.logo"),
        buttonColor: Color("sky_blue"),
        action: {}
    )
}


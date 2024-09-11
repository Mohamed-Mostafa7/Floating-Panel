//
//  FloatingPanelTopView.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 11/09/2024.
//

import SwiftUI

struct FloatingPanelTopView: View {
    @Binding var isShowingFloatingPanel: Bool
    @Binding var panelPosition: CGPoint
    var body: some View {
        HStack{
            VStack{
                Rectangle()
                    .background(Color(.lightGray))
                    .frame(width: 50, height: 6)
                    .foregroundColor(.gray)
                    .cornerRadius(3)
                    .padding(.bottom)
                
                Text("Frameworks Results")
            }
            .padding(.leading, 45)
            .frame(maxWidth: .infinity)
            
            Button {
                isShowingFloatingPanel = false
                panelPosition = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height*Constants.multiplierFor90percentScreen)
            } label: {
                Image(systemName: "xmark")
            }
            .foregroundColor(Color(.label))
            .buttonStyle(.bordered)
            .clipShape(Circle())
            
        }
        .padding()
    }
}

#Preview {
    FloatingPanelTopView(isShowingFloatingPanel: .constant(false), panelPosition: .constant(.zero))
}

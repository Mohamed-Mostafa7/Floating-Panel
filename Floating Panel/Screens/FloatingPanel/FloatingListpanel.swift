//
//  FloatingListpanel.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 10/09/2024.
//

import SwiftUI

struct FloatingListpanel: View {
    @Binding var isShowingFloatingPanel: Bool
    @Binding var panelPosition: CGPoint
        var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack{
                // adding the top View that will be used for draging the view.
                FloatingPanelTopView(isShowingFloatingPanel: $isShowingFloatingPanel, panelPosition: $panelPosition)
                                
                List {
                    ForEach(MockData.frameworks) { framework in
                        ListCell(name: framework.name)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .highPriorityGesture(DragGesture())
            }
        }
    }
}

#Preview {
    FloatingListpanel(isShowingFloatingPanel: .constant(false), panelPosition: .constant(.zero))
}

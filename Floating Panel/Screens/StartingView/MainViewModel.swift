//
//  MainViewModel.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 11/09/2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var isShowingFloatingPanel: Bool = false
    @Published var offset: CGFloat = 0
    @Published var position = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height*Constants.multiplierFor90percentScreen)
    
    var panelPositionAs90Precent = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height*Constants.multiplierFor90percentScreen)
    var panelPositionAs50percent = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height*Constants.multiplierFor50percentScreen)
    
    
    // check the the view position to choose if it's gonna be displayed as 90%, 50%, or even dismissed.
    func CalculatePosition(currentPanelYPosition: Double) {
        
        if currentPanelYPosition < UIScreen.main.bounds.height * 0.25 {
            // set the panel position to 90%
            position = panelPositionAs90Precent
        } else if currentPanelYPosition > UIScreen.main.bounds.height * 0.60 {
            // this dismisses the view.
            isShowingFloatingPanel = false
            //then setting back the position to 90% after dismissing so that it can be 90% displayed in the next time.
            position = panelPositionAs90Precent
        }else {
            // set the panel position to 50%
            position = panelPositionAs50percent
        }
        
    }
}

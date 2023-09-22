//
//  ExplainCompareVC.swift
//  reCollect_organized
//
//  Created by Daniel Pikovsky Yoffe on 30/09/2023.
//

//
//  ExplainRateVC.swift
//  reCollect_organized
//
//  Created by Daniel Pikovsky Yoffe on 30/09/2023.
//

import UIKit

class ExplainCompareVC: ExplainVC {
    
    override func labelForStage()-> String {
        return "Significance"
    }
    
    override func textForState(_ state: State) -> String {
        switch state {
        case .stage0: return ""
        case .stage1: return "In this stage you will compare pairs of memories in different cognitive domains.\nDifferent memories have different aspects (emotion, duration etc.) and we belive that those aspects have a valuable significance in our memories. "
        case .stage2: return "For each domain, random pairs of memories from your chosen dataset will be displayed on the screen. "
        case .stage3: return "By tapping a memory you can decide - which memory has more of the given domain.\n\nAre you ready? "
        case .finished: return ""
        }
    }
    
    override func imageForState(_ state: State) -> UIImage? {
        switch state {
        case .stage0: return nil
        case .stage1: return UIImage(named: "compare1")
        case .stage2: return UIImage(named: "compare2")
        case .stage3: return UIImage(named: "compare3")
        case .finished: return nil
        }
    }
    
    override func changeZoomToCurrentExplain() {
        Background.shared.changeZoom(newScale: 2.4, newX: 100, newY: -100, duration: 1)
    }
    
    override func advanceToNextVC(){
        self.delegate?.handler(self, didFinishWithTransitionTo: CompareVC.self)
    }
}

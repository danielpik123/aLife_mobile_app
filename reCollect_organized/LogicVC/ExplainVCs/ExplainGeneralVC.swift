//
//  ExplainGeneralVC.swift
//  reCollect_organized
//
//  Created by Daniel Pikovsky Yoffe on 03/08/2023.
//

import UIKit

class ExplainGeneralVC: ExplainVC {
    override func textForState(_ state: State) -> String {
        switch state {
        case .stage0: return ""
        case .stage1: return "In an age where personal data is the new currency, our every move is carefully recorded, updated, and studied. Those who dive into this vast ocean of information claim to know our desires, but more often than not, their economic interests take precedence over our true needs. "
        case .stage2: return "Enter reCollect, your beacon in this sea of data exploration. We're pioneering a different kind of research, one that delves into the heart of what truly matters in human experiences. "
        case .stage3: return "Ever wonder why some moments urge you to reach for your mobile device, while others pass unnoticed? With reCollect, we ponder this enigma. We believe that in the midst of countless daily experiences, the moments you choose to capture hold profound significance. Let's delve into that together! "
        case .finished: return ""
        }
    }
    
    override func imageForState(_ state: State) -> UIImage? {
        switch state {
        case .stage0: return nil
        case .stage1: return UIImage(named: "seaOfData")
        case .stage2: return UIImage(named: "beacon")
        case .stage3: return UIImage(named: "photoObjects")
        case .finished: return nil
        }
    }
}

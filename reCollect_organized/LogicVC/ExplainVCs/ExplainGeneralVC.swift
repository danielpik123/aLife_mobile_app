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
        case .stage1: return "In an age where personal data is the new currency, our every move is carefully recorded, updated, and studied.\nThose who dive into this vast ocean of information claim to know our desires, but more often than not, their economic interests take precedence over our true needs. "
        case .stage2: return "Enter reCollect, your beacon in this sea of data exploration.\nWe're pioneering a different kind of research, one that delves into the heart of what truly matters in human experiences. "
        case .stage3: return "Ever wonder why some moments urge you to reach for your mobile device, while others pass unnoticed?\nWith reCollect, we ponder this enigma. We believe that in the midst of countless daily experiences, the moments you choose to capture hold profound significance. Let's delve into that together! "
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
    
    override func changeZoomToCurrentExplain() {
        Background.shared.changeZoom(newScale: 2, newX: 200, newY: 60, duration: 1)
    }
    override func advanceToNextVC(){
        self.delegate?.handler(self, didFinishWithTransitionTo: InfoVC.self)
    }
    override func setupView() {
        view.addSubview(outerWindow)
        view.addSubview(innerWindow)
        view.addSubview(gifView)
        innerWindow.contentView.addSubview(label)
        view.addSubview(nextButton)
        view.addSubview(progressMeter)
        
        
        
        NSLayoutConstraint.activate([
            //            outerWindow.topAnchor.constraint(equalTo: view.topAnchor, constant: bottomPadding),
            outerWindow.topAnchor.constraint(equalTo: TopBarManager.shared.topBar.bottomAnchor, constant: 2*padding),
            outerWindow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding*2),
            outerWindow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding*2),
            outerWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomPadding),
            
            innerWindow.centerXAnchor.constraint(equalTo: outerWindow.centerXAnchor),
            innerWindow.centerYAnchor.constraint(equalTo: outerWindow.centerYAnchor),
            innerWindow.widthAnchor.constraint(equalTo: outerWindow.widthAnchor, constant: -padding*2),
            innerWindow.heightAnchor.constraint(equalTo: outerWindow.heightAnchor, constant:  -padding*2)
        ])
        
        NSLayoutConstraint.activate([
            gifView.topAnchor.constraint(equalTo: innerWindow.contentView.topAnchor, constant: padding*2),
            gifView.leadingAnchor.constraint(equalTo: innerWindow.contentView.leadingAnchor, constant: padding*2),
            gifView.trailingAnchor.constraint(equalTo: innerWindow.contentView.trailingAnchor, constant: -padding*2),
        ])
        
        gifView.widthAnchor.constraint(equalTo: innerWindow.contentView.widthAnchor, constant: (-4)*padding).isActive = true
        gifView.heightAnchor.constraint(equalTo: innerWindow.contentView.widthAnchor, constant: (-4)*padding).isActive = true
        
        NSLayoutConstraint.activate([
            
            label.leadingAnchor.constraint(equalTo: innerWindow.contentView.leadingAnchor, constant: 2*padding),
            label.trailingAnchor.constraint(equalTo: innerWindow.contentView.trailingAnchor, constant: (-2)*padding),
            label.topAnchor.constraint(equalTo: gifView.bottomAnchor, constant: padding*2),
            //            label.bottomAnchor.constraint(equalTo: innerWindow.contentView.bottomAnchor, constant: 2*padding),
            
        ])
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: outerWindow.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: outerWindow.bottomAnchor, constant: padding*1),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding*3),
        ])
        
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalTo: nextButton.heightAnchor)
        ])
        
        progressMeter.centerYAnchor.constraint(equalTo: innerWindow.contentView.bottomAnchor, constant: -padding*2).isActive = true
        progressMeter.centerXAnchor.constraint(equalTo: innerWindow.centerXAnchor).isActive = true
        
    }
}

//
//  ChooseVC.swift
//  reCollect_organized
//
//  Created by Daniel Pikovsky Yoffe on 23/07/2023.
//

import UIKit

class ChooseVC: ViewControllerHandler {
    weak var delegate: ViewControllerHandlerDelegate?
    let view: UIView
    public var framedMemory: FramedMemory!
    var nextButton: CustomNextButton = CustomNextButton(behavior: ScaleBehavior(), width: UIScreen.main.bounds.width / 2, height: TopBarManager.shared.topBar.frame.height/2)

    
    init(view: UIView) {
        self.view = view
        
        let image = PhotoLoader.shared.getCurrentPhoto { image, localIdentifier  in
            guard let image = image else {
                print("No image available or access denied.")
                return
            }
            
            DispatchQueue.main.async { [self] in
                self.framedMemory = FramedMemory(image: image, localIdentifier: localIdentifier!, chooseVC: self)
                
                // Add `framedMemory` to your view hierarchy
                self.view.addSubview(self.framedMemory)
                
                self.framedMemory.setupSuperviewConstraints()
                
                UIView.animate(withDuration: 1, animations: {
                    self.framedMemory.alpha = 1
                })
            }
        }
    }


    func setupView() {
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.isUserInteractionEnabled = false
        
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: (-10) - TopBarManager.shared.topBar.frame.height/2).isActive = true
        
//        nextButton.alpha = 1

    }

    func teardownView() {
        framedMemory.removeFromSuperview()
        nextButton.removeFromSuperview()
    }

    func executeLogic() {
        print("Starting logic of TestLogicVC2")
        Background.shared.changeZoom(newScale: 2, newX: 125, newY: 180, duration: 1) // pisitive: left & up
        UIView.animate(withDuration: 1, animations: {
        })
        print("Finished logic of TestLogicVC2")
    }

   
    deinit {
        print("\(self) is being deallocated")
    }
    
    @objc func nextButtonTapped() {
        self.framedMemory.behavior.action = nil
        UIView.animate(withDuration: 1, animations: {
            self.framedMemory.alpha = 0
            self.nextButton.alpha = 0
        }){ _ in
            self.delegate?.handler(self, didFinishWithTransitionTo: RateVC.self)
        }
    }

}

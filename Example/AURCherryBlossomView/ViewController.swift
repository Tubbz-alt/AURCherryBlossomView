//
//  ViewController.swift
//  AURCherryBlossomView
//
//  Created by aminaura on 03/15/2016.
//  Copyright (c) 2016 aminaura. All rights reserved.
//

import UIKit
import AURCherryBlossomView

class ViewController: UIViewController {
    
    var cherryBlossomView: AURCherryBlossomView!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init CherryBlossomView
        cherryBlossomView = AURCherryBlossomView(frame: self.view.bounds)
        
        // Set birthRate
        cherryBlossomView.birthRate = 4.0
        
        // Chose type from .CherryBlossom, .Plum, .Dandelion
        cherryBlossomView.type = .CherryBlossom
        
        // true
        cherryBlossomView.userInteractionEnabled = false
        
        // Add subview
        view.addSubview(cherryBlossomView)
        
        // Start Blossom!
        cherryBlossomView.startBlossom()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        cherryBlossomView.type = nextType(cherryBlossomView.type)
    }
    
    private func nextType(type: AURCherryBlossomView.BlossomType) -> AURCherryBlossomView.BlossomType {
        switch type {
        case .CherryBlossom:
            return AURCherryBlossomView.BlossomType.Dandelion
        case .Dandelion:
            return AURCherryBlossomView.BlossomType.Plum
        case .Plum:
            return AURCherryBlossomView.BlossomType.CherryBlossom
        }
    }
}




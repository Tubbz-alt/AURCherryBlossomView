//
//  AOCherryBlossomView.swift
//  CherryBlossom
//
//  Created by AuraOtsuka on 2016/03/15.
//  Copyright © 2016年 AuraOtsuka. All rights reserved.
//

import UIKit
import QuartzCore

public class AURCherryBlossomView: UIView {
    
    public enum BlossomType {
        case CherryBlossom
        case Plum
        case Dandelion
    }
    
    var emitter: CAEmitterLayer!
    public var colors: [UIColor]!
    public var type: BlossomType!
    public var birthRate: Float!
    private var active :Bool!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        type = .CherryBlossom
        birthRate = 4.0
        active = false
    }
    
    public func startBlossom() {
        emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: frame.size.width / 2.0, y: 0)
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterSize = CGSize(width: frame.size.width, height: 1)
        
        var cells = [CAEmitterCell]()
        cells.append(generateBlossom())
        
        emitter.emitterCells = cells
        layer.addSublayer(emitter)
        active = true
    }
    
    public func stopBlossom() {
        emitter?.birthRate = 0
        active = false
    }
    
    func imageForType(type: BlossomType) -> UIImage? {
        
        var fileName: String!
        
        switch type {
        case .Plum:
            fileName = "plum"
        case .CherryBlossom:
            fileName = "cherryblossoms"
        case .Dandelion:
            fileName = "dandelion"
        }
        
        let path = NSBundle(forClass: AURCherryBlossomView.self).pathForResource("AURCherryBlossomView", ofType: "bundle")
        let bundle = NSBundle(path: path!)
        let imagePath = bundle?.pathForResource(fileName, ofType: "png")
        let url = NSURL(fileURLWithPath: imagePath!)
        let data = NSData(contentsOfURL: url)
        if let data = data {
            return UIImage(data: data)!
        }
        return nil
    }
    
    func generateBlossom() -> CAEmitterCell {
        let blossom = CAEmitterCell()
        blossom.birthRate = birthRate
        blossom.lifetime = 7.0
        blossom.scale = 1
        blossom.lifetimeRange = 0
        blossom.velocity = CGFloat(140.0)
        blossom.velocityRange = CGFloat(40.0)
        blossom.emissionLongitude = CGFloat(M_PI)
        blossom.emissionRange = CGFloat(M_PI_4)
        blossom.spin = CGFloat(3)
        blossom.spinRange = CGFloat(3)
        blossom.scaleRange = CGFloat(0.5)
        blossom.scaleSpeed = CGFloat(-0.05)
        blossom.contents = imageForType(type)!.CGImage
        return blossom
    }
    
    public func isActive() -> Bool {
        return self.active
    }
}

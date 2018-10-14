//
//  Ramp.swift
//  ramp-up
//
//  Created by Massimiliano Abeli on 14/10/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import Foundation
import SceneKit

class Ramp {
    
    class func getRampForName(name: String) -> SCNNode {
        switch name {
        case "pipe":
            return Ramp.getPipe()
        case "pyramid":
            return Ramp.getPyramid()
        case "quarter":
            return Ramp.getQuarter()
        default:
            return Ramp.getPipe()
        }
    }
    
    class func getPipe() -> SCNNode {
        let pipe = SCNScene(named: "art.scnassets/pipe.dae")
        let pipeNode = pipe?.rootNode.childNode(withName: "pipe", recursively: true)
//        let rotation = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi) , z: 0, duration: 0.1))
//        pipeNode?.runAction(rotation)
        pipeNode?.scale = SCNVector3Make(0.0018, 0.0018, 0.0018)
        pipeNode?.position = SCNVector3Make(-0.03, 0.8, -1)
        return pipeNode!
    }
    
    class func getPyramid() -> SCNNode {
        let pyramid = SCNScene(named: "art.scnassets/pyramid.dae")
        let pyramidNode = pyramid?.rootNode.childNode(withName: "pyramid", recursively: true)
//        pyramidNode?.runAction(rotation)
        pyramidNode?.scale = SCNVector3Make(0.0042, 0.0042, 0.0042)
        pyramidNode?.position = SCNVector3Make(-0.06, -0.1, -1)
        return pyramidNode!
    }
    
    class func getQuarter() -> SCNNode {
        let quarter = SCNScene(named: "art.scnassets/quarter.dae")
        let quarterNode = quarter?.rootNode.childNode(withName: "quarter", recursively: true)
//        quarterNode?.runAction(rotation)
        quarterNode?.scale = SCNVector3Make(0.0042, 0.0042, 0.0042)
        quarterNode?.position = SCNVector3Make(-0.06, -1, -1)
        return quarterNode!
    }
    
    class func startRotation(node: SCNNode) {
        let rotation = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi) , z: 0, duration: 0.1))
        node.runAction(rotation)
    }
}

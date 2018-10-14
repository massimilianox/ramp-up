//
//  RampPickerVC.swift
//  ramp-up
//
//  Created by Massimiliano Abeli on 13/10/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit
import SceneKit

protocol RampPickerVCDelegate: class {
    func onRampSelected(_ nodeName: String)
}


class RampPickerVC: UIViewController {

    var sceenView: SCNView!
    var size: CGSize!
    
    weak var rampPlacerVC: RampPlacerVC!

    weak var delegate: RampPickerVCDelegate!
    
    init(size: CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(origin: CGPoint.zero, size: size)
        sceenView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.insertSubview(sceenView, at: 0)
        
        let sceen = SCNScene(named: "art.scnassets/ramps.scn")!
        sceenView.scene = sceen
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        sceen.rootNode.camera = camera
        
        preferredContentSize = size
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer(_:)))
        sceenView.addGestureRecognizer(tap)
        
        let pipeNode = Ramp.getPipe()
        Ramp.startRotation(node: pipeNode)
        sceen.rootNode.addChildNode(pipeNode)
        
        let pyramidNode = Ramp.getPyramid()
        Ramp.startRotation(node: pyramidNode)
        sceen.rootNode.addChildNode(pyramidNode)
        
        let quarterNode = Ramp.getQuarter()
        Ramp.startRotation(node: quarterNode)
        sceen.rootNode.addChildNode(quarterNode)
        
    }
    

    @objc func tapGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        let p = gestureRecognizer.location(in: sceenView)
        let hitResult = sceenView.hitTest(p, options: [:])
        print("tapped")
        if hitResult.count > 0 {
            let node = hitResult[0].node
            print(node.name!)
            delegate?.onRampSelected(node.name!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

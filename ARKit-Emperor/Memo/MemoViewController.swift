//
//  MemoViewController.swift
//  ARKit-Emperor
//
//  Created by Kei Fujikawa on 2018/09/06.
//  Copyright © 2018年 KBOY. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class MemoViewController: UIViewController {
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//        sceneView.scene = scene
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        sceneView.addGestureRecognizer(gesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    @objc func tapGesture(_ recognizer: UITapGestureRecognizer) {
        let textNode = TextNode()
        textNode.setText("こんにちは")
        
        let front = SCNVector3Make(0, 0, -0.5)
        
        if let cameraNode = sceneView.pointOfView {
            let position = cameraNode.convertPosition(front, to: nil)
            textNode.position = position
            sceneView.scene.rootNode.addChildNode(textNode)
        }
    }
}

// MARK: - <#ARSCNViewDelegate#>
extension MemoViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        return node
    }
}

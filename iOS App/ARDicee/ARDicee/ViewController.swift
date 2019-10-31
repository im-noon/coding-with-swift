//
//  ViewController.swift
//  ARDicee
//
//  Created by Slimn Srarena on 27/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    var diceArray = [SCNNode]()

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self

        sceneView.autoenablesDefaultLighting = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // iPhone 6+ or later
        if ARWorldTrackingConfiguration.isSupported {
            // Create a session configuration
            let configuration = ARWorldTrackingConfiguration()
            
            configuration.planeDetection = .horizontal
            // Run the view's session
            sceneView.session.run(configuration)
        }
        else {
            // Create a session configuration
            let configuration = ARPositionalTrackingConfiguration()
            
            // Run the view's session
            sceneView.session.run(configuration)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    //MARK: - Rendering dice
    func addDice(atLocation location:ARHitTestResult) {
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")
        
        if let diceNode = diceScene?.rootNode.childNode(withName: "Dice", recursively: true) {
            
            diceNode.position = SCNVector3(
                location.worldTransform.columns.3.x,
                location.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                location.worldTransform.columns.3.z
            )
            
            diceArray.append(diceNode)
            
            sceneView.scene.rootNode.addChildNode(diceNode)
            
            roll(diceNode)
        }
    }
    
    func rolAll() {
        if !diceArray.isEmpty {
            for dice in diceArray {
                roll(dice)
            }
        }
    }
    
    func roll(_ dice : SCNNode) {
        // Rotation over X and Z axis
        
        let randomX = Float(arc4random_uniform(4) + 1 ) * (Float.pi/2)
        
        let randomZ = Float(arc4random_uniform(4) + 1 ) * (Float.pi/2)
        
        dice.runAction(
            SCNAction.rotateBy(
                x: CGFloat(randomX * 5),
                y: 0,
                z: CGFloat(randomZ * 5),
                duration: 0.5
            )
        )
    }
    
    //MARK: - Action Button method
    @IBAction func removeAllDicePressed(_ sender: UIBarButtonItem) {
        if !diceArray.isEmpty {
            for dice in diceArray {
                dice.removeFromParentNode()
            }
        }
    }
    
    @IBAction func rollAgainPressed(_ sender: UIBarButtonItem) {
        rolAll()
    }
    
    //MARK: - Touch Action method
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rolAll()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            // 2D coor
            let touchLocation = touch.location(in: sceneView)
            
            // Convert to 3D
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = results.first {
                addDice(atLocation: hitResult)
            }
        }
    }
    
    //MARK: - Rendering plane
    func createPlane(withPlanAnchor planeAnchor:ARPlaneAnchor)->SCNNode  {
        
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        
        let planeNode = SCNNode()
        
        planeNode.position = SCNVector3(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
        
        let gridMaterial = SCNMaterial()
        
        gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
        
        plane.materials = [gridMaterial]
        
        planeNode.geometry = plane
        
        return planeNode
    }
    
    
    //MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard let planeAnchor = anchor as? ARPlaneAnchor  else { return }
        
        let planeNode = createPlane(withPlanAnchor: planeAnchor)
        
        node.addChildNode(planeNode)
    }
    
}

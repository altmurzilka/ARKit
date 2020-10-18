//
//  ViewController.swift
//  Hello AR
//
//  Created by Алтын on 10/15/20.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!

        // Set the scene to the view
//        sceneView.scene = scene
        
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
        
        drawSpereAtOrigin()
        drawBoxAt1200High()
        drawPyramidAt600Low()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func drawSpereAtOrigin() {
        let sphere = SCNNode(geometry: SCNSphere(radius: 0.05))
        sphere.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earth")
        sphere.geometry?.firstMaterial?.specular.contents = UIColor.yellow
        sphere.position = SCNVector3(0, 0, 0)
        sceneView.scene.rootNode.addChildNode(sphere)
    }
    
    func drawBoxAt1200High() {
        let box = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0))
        box.position = SCNVector3(0, 0.2, -0.3)
        box.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        box.geometry?.firstMaterial?.specular.contents = UIColor.white
        sceneView.scene.rootNode.addChildNode(box)
    }
    
    func drawPyramidAt600Low() {
        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
        pyramid.position = SCNVector3(0, -0.2, 0.3)
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.green // ads actual color
        pyramid.geometry?.firstMaterial?.specular.contents = UIColor.red // adds shine
        sceneView.scene.rootNode.addChildNode(pyramid)
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

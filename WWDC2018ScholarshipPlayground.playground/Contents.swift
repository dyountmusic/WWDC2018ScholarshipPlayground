//: # WWDC 2018 Scholarship Playground
//: ### Author: Daniel Yount (yountdaniel@gmail.com)
//: ### GitHub: dyountmusic

/*:
 Change properties of `theView` and run the playground.
 Try modifying:
 * count in addBoxes()
 */

//#-hidden-code
import PlaygroundSupport
import SceneKit

let scene = SCNScene()

let box = SCNBox(width: 0.8, height: 0.8, length: 0.8, chamferRadius: 0.1)

func addBoxes(count: Int){
    let length = Int(ceil(cbrt(Float(count)))) // ceilinged cube root
    for i in 0..<count {
        let node = SCNNode(geometry: box)
        node.position = SCNVector3(i % length,  i / (length * length) , (i / length) % length)
        scene.rootNode.addChildNode(node)
    }
}
//#-end-hidden-code

addBoxes(count: /*#-editable-code*/ 38 /*#-end-editable-code*/)

//#-hidden-code
let view = SCNView()
view.allowsCameraControl = true
view.autoenablesDefaultLighting = true
view.showsStatistics = true
view.scene = scene
PlaygroundPage.current.liveView = view
//#-end-hidden-code

//let zenSandbox = ZenSandbox()
//PlaygroundPage.current.liveView = zenSandbox

//let simonSaysViewController = SimonSaysViewController()
//PlaygroundPage.current.liveView = simonSaysViewController

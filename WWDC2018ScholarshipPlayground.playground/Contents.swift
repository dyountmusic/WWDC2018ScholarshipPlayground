//: A UIKit based Playground for presenting user interface
  
import UIKit

import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func viewDidLoad() {
        // Do Cool Stuff Here!
    }
    
    override func loadView() {
        let view = UIView()
        
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


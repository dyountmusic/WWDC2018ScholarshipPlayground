//: WWDC 2018 Scholarship Playground
//: Author: Daniel Yount (yountdaniel@gmail.com)
//: GitHub: dyountmusic
  
import UIKit

import PlaygroundSupport

class MainViewController : UIViewController {
    
    var name: String {
        get { return UserDefaults.standard.string(forKey: "name") ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: "name") }
    }
    
    override func viewDidLoad() {
        // Do Cool Stuff Here!
        
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        // Setting
        name = "Daniel"
        
        // Printing
        print(name)
        
        // Checking Disk Value
        UserDefaults.standard.string(forKey: "name")!
        
        self.view = view
    }
}


PlaygroundPage.current.liveView = MainViewController()


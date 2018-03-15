import Foundation
import UIKit

public struct UISetUpHelper {
    
    public init() {
        
    }
    
    public func presentGreetingLabel(view: UIView) {
        let label = UILabel()
        label.text = "Hello, WWDC"
        label.textColor = .red
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 20)
        label.center = view.convert(view.center, from:view.superview)
        
        view.addSubview(label)
    }
    
    public func presentProfileImage(view: UIView) {
        let picture = UIImageView(image: UIImage(named: "profile_bw.jpg"))
        picture.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        picture.layer.cornerRadius = 20.0
        picture.clipsToBounds = true
        picture.center = view.convert(view.center, from:view.superview)
        
        view.addSubview(picture)
    }
    
    
    
}

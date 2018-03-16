import Foundation
import UIKit
import PlaygroundSupport

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

class SimonSaysViewController: UIViewController {
    
    private var tiles: [UIView] = []
    private var colorPattern: [UIColor] = [#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)]
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        setUpTiles()
        layoutTiles()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.lightGray
        
    }
    
    func setUpTiles() {
        
        for i in 0 ... colorPattern.count-1 {
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            view.backgroundColor = colorPattern[i]
            view.layer.cornerRadius = 5.0
            view.clipsToBounds = true
            
            self.view.addSubview(view)
            tiles.append(view)
        }
        
        tiles.shuffle()
        
    }
    
    func layoutTiles() {
        
        let width = view.bounds.width/2
        let height = view.bounds.height/2
        
        var currentXPlace = 15
        var currentYPlace = Int(height/2)
        
        for t in tiles {
            
            if currentXPlace > 350 {
                currentYPlace += 75
                currentXPlace = 15
            }
            
            t.frame = CGRect(x: 0 + currentXPlace, y: 0 + currentYPlace, width: 50, height: 50)
            currentXPlace += 75
        }
        
    }
    
}

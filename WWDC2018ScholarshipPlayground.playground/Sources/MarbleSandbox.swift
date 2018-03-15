import UIKit
import XCPlayground

public class MarbleSandbox: UIView {
    
    private let colors: [UIColor]
    private var marbles: [UIView] = []
    
    private var animator: UIDynamicAnimator?
    private var snapBehavior: UISnapBehavior?
    
    public let collisionBehavior: UICollisionBehavior
    public let gravityBehavior: UIGravityBehavior
    public let itemBehavior: UIDynamicItemBehavior
    
    public init(colors: [UIColor]) {
        self.colors = colors
        collisionBehavior = UICollisionBehavior(items: [])
        gravityBehavior = UIGravityBehavior(items: [])
        itemBehavior = UIDynamicItemBehavior(items: [])
        
        super.init(frame: CGRect(x: 0, y: 0, width: 480, height: 320))

        backgroundColor = .white
        
        fillBackground()
        
        animator = UIDynamicAnimator(referenceView: self)
        animator?.addBehavior(collisionBehavior)
        animator?.addBehavior(gravityBehavior)
        animator?.addBehavior(itemBehavior)
        
        createMarbles()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        for marble in marbles {
            marble.removeObserver(self, forKeyPath: "center")
        }
    }
    
    public var useSquaresInsteadOfBalls:Bool = false {
        didSet {
            for marble in marbles {
                if useSquaresInsteadOfBalls {
                    marble.layer.cornerRadius = 0
                }
                else {
                    marble.layer.cornerRadius = marble.bounds.width / 2.0
                    marble.clipsToBounds = true
                }
            }
        }
    }
    
    func fillBackground() {
        UIGraphicsBeginImageContextWithOptions(super.frame.size, true, 0.0)
        UIImage(named: "zenGardenBG.jpg")?.draw(in: super.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            super.backgroundColor = UIColor(patternImage: image)
        } else {
            UIGraphicsEndImageContext()
            print("Image not avaliable")
        }
    }
    
    func createMarbles() {
        for marbleColor in colors {
            let ballMarble = UIView(frame: CGRect.zero)
            
            ballMarble.addObserver(self, forKeyPath: "center", options: NSKeyValueObservingOptions.init(rawValue: 0), context: nil)
            
            ballMarble.backgroundColor = marbleColor
            
            addSubview(ballMarble)
            marbles.append(ballMarble)
            
            layoutMarbles()
            
        }
    }
    
    func layoutMarbles() {
        let requiredWidth = CGFloat(marbles.count) * (marbleSize.width + CGFloat(marblePadding))
        
        for (index, marble) in marbles.enumerated() {
            collisionBehavior.removeItem(marble)
            //gravityBehavior.removeItem(marble)
            itemBehavior.removeItem(marble)
            
            let marbleXOrigin = ((bounds.width - requiredWidth) / 2.0) + (CGFloat(index) * (marbleSize.width + CGFloat(marblePadding)))
            marble.frame = CGRect(x: marbleXOrigin, y: bounds.midY, width: marbleSize.width, height: marbleSize.height)
            
            collisionBehavior.addItem(marble)
            //gravityBehavior.addItem(marble)
            itemBehavior.addItem(marble)
            
            switch index {
            case 0:
                // W
                if let maskImage = UIImage(named: "W@3x.png") {
                    let maskImageSized = imageWithImage(image: maskImage, scaledToSize: marbleSize)
                    marble.mask = UIImageView(image: maskImageSized)
                }
            case 1:
                // W
                if let maskImage = UIImage(named: "W@3x.png") {
                    let maskImageSized = imageWithImage(image: maskImage, scaledToSize: marbleSize)
                    marble.mask = UIImageView(image: maskImageSized)
                }
            case 2:
                // D
                if let maskImage = UIImage(named: "D@3x.png") {
                    let maskImageSized = imageWithImage(image: maskImage, scaledToSize: marbleSize)
                    marble.mask = UIImageView(image: maskImageSized)
                }
            case 3:
                // C
                if let maskImage = UIImage(named: "C@3x.png") {
                    let maskImageSized = imageWithImage(image: maskImage, scaledToSize: marbleSize)
                    marble.mask = UIImageView(image: maskImageSized)
                }
            case 4:
                // 2
                if let maskImage = UIImage(named: "2@3x.png") {
                    let maskImageSized = imageWithImage(image: maskImage, scaledToSize: marbleSize)
                    marble.mask = UIImageView(image: maskImageSized)
                }
            case 5:
                // 0
                if let maskImage = UIImage(named: "0@3x.png") {
                    let maskImageSized = imageWithImage(image: maskImage, scaledToSize: marbleSize)
                    marble.mask = UIImageView(image: maskImageSized)
                }
            case 6:
                // 1
                if let maskImage = UIImage(named: "1@3x.png") {
                    let maskImageSized = imageWithImage(image: maskImage, scaledToSize: marbleSize)
                    marble.mask = UIImageView(image: maskImageSized)
                }
            case 7:
                // 8
                if let maskImage = UIImage(named: "8@3x.png") {
                    let maskImageSized = imageWithImage(image: maskImage, scaledToSize: marbleSize)
                    marble.mask = UIImageView(image: maskImageSized)
                }
            default:
                // no mask
                print()
            }
            
        }
    }
    
    public var marbleSize: CGSize = CGSize(width: 50, height: 50) {
        didSet {
            layoutMarbles()
        }
    }
    
    public var marblePadding: Double = 0.0 {
        didSet {
            layoutMarbles()
        }
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: superview)
            for marble in marbles {
                if (marble.frame.contains(touchLocation)) {
                    snapBehavior = UISnapBehavior(item: marble, snapTo: touchLocation)
                    animator?.addBehavior(snapBehavior!)
                }
            }
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: superview)
            if let snapBehavior = snapBehavior {
                snapBehavior.snapPoint = touchLocation
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let snapBehavior = snapBehavior {
            animator?.removeBehavior(snapBehavior)
        }
        snapBehavior = nil
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "center") {
            setNeedsDisplay()
        }
    }
    
    func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
}

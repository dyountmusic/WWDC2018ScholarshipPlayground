//: WWDC 2018 Scholarship Playground
//: Author: Daniel Yount (yountdaniel@gmail.com)
//: GitHub: dyountmusic
  
import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
containerView.backgroundColor = UIColor.lightGray

let setupHelper = UISetUpHelper.init()

setupHelper.presentProfileImage(view: containerView)
setupHelper.presentGreetingLabel(view: containerView)

PlaygroundPage.current.liveView = containerView

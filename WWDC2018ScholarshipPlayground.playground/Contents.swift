//: WWDC 2018 Scholarship Playground
//: Author: Daniel Yount (yountdaniel@gmail.com)
//: GitHub: dyountmusic
  
import UIKit
import PlaygroundSupport
import XCPlayground

//: ## This playground works with UIKit physics

let marbleSandbox = MarbleSandbox(colors: [#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)])

marbleSandbox.marblePadding = 2.0

marbleSandbox.marbleSize = CGSize(width: 50, height: 50)

marbleSandbox.itemBehavior.resistance = 2

marbleSandbox.useSquaresInsteadOfBalls = true

PlaygroundPage.current.liveView = marbleSandbox

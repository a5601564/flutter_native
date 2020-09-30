//
//  ViewController.swift
//  testswift
//
//  Created by admin on 9/30/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 50, y: 50+100))
        bezierPath.addCurve(to: CGPoint(x: 50+200, y: 50),
                            controlPoint1: CGPoint(x: 50+10, y: 50+75),
                            controlPoint2: CGPoint(x: 50+100, y: 50))
        bezierPath.addCurve(to: CGPoint(x: 50+400, y: 50+150),
                            controlPoint1: CGPoint(x: 50+300, y: 50),
                            controlPoint2: CGPoint(x: 50+400-10, y: 50+75))

        let attributedString = NSAttributedString(
            string: "Where did you come from, where did you go?",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.ultraLight),
                NSAttributedString.Key.foregroundColor: UIColor.red
            ])
        // Do any additional setup after loading the view.
        let bezier = Bezier(path: bezierPath.cgPath)

        // generate an image
        let image = bezier.image(withAttributed: attributedString)

        // or render onto a preexisting context
        bezier.draw(attributed: attributedString, to: UIGraphicsGetCurrentContext()!)
        
        let label = UIBezierLabel(frame: .zero)
            
        // set the properties
        label.bezierPath = bezierPath.cgPath
        label.textAlignment = .center
        label.text = "Where did you come from, where did you go?"
        label.sizeToFit()
        self.view.addSubview(label)
    }


}


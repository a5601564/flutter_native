//
//  MyView2.swift
//  Runner
//
//  Created by Phuoc on 9/30/20.
//

import Foundation
class MyView2: UIView {
    override func draw(_ rect: CGRect) {
           guard let context = UIGraphicsGetCurrentContext() else { return }
           let size = self.bounds.size
        let height = size.height;
        let width = size.width;
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: (431/500)*height))
        bezierPath.addCurve(to: CGPoint(x:(500/500)*width, y: (449/500)*height),
                            controlPoint1: CGPoint(x: (47/500)*width, y: (500/500)*height),
                            controlPoint2: CGPoint(x: (419/500)*width, y: (305/500)*height))
//
//        bezierPath.addCurve(to: CGPoint(x:(262/500)*width, y: (356/500)*height),
//                            controlPoint1: CGPoint(x: (395/500)*width, y: (344/500)*height),
//                            controlPoint2: CGPoint(x: (486/500)*width, y: (354/500)*height))
////
//        bezierPath.addCurve(to: CGPoint(x:(582/500)*width, y: (365/500)*height),
//                            controlPoint1: CGPoint(x: (618/500)*width, y: (434/500)*height),
//                            controlPoint2: CGPoint(x: (603/500)*width, y: (431/500)*height))
       
        

        let attributedString = NSAttributedString(
            string: "Where did you come f yousdfsd sf sdf sf  go?",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.ultraLight),
                NSAttributedString.Key.foregroundColor: UIColor.red
            ])
        // Do any additional setup after loading the view.
        let bezier = Bezier(path: bezierPath.cgPath)

        // generate an image
        _ = bezier.image(withAttributed: attributedString)

        // or render onto a preexisting context
        bezier.draw(attributed: attributedString, to: context)
        
        let label = UIBezierLabel(frame: .zero)
            
        // set the properties
        label.bezierPath = bezierPath.cgPath
        label.textAlignment = .center
        label.text = "Wherecome froo?"
        label.sizeToFit()
        label.layoutSubviews()
        label.layoutIfNeeded()
       }
}

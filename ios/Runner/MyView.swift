//
//  MyView2.swift
//  Runner
//
//  Created by Phuoc on 9/30/20.
//

import Foundation
class MyView: UIView {
    var text : String = "card name ios"
    var textSize: Float = 20
    public func setTextOnPath(text: String, textSize: Float){
        self.text = text
        self.textSize = textSize
    }
    override func draw(_ rect: CGRect) {
           guard let context = UIGraphicsGetCurrentContext() else { return }
           let size = self.bounds.size
        let height = size.height;
        let width = size.width;
        print(height , " : " ,width);
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: (0/611)*width, y: (125/165)*height))
        bezierPath.addCurve(to: CGPoint(x:(611/611)*width, y: (125/165)*height),
                            controlPoint1: CGPoint(x: (90/611)*width, y: (170/165)*height),
                            controlPoint2: CGPoint(x:(450/611)*width, y: (15/165)*height))
        

        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ])
        // Do any additional setup after loading the view.
        let bezier = Bezier(path: bezierPath.cgPath)

        // generate an image
        _ = bezier.image(withAttributed: attributedString)

        // or render onto a preexisting context
        bezier.draw(attributed: attributedString, to: context)
        
    
        
      //  label.layoutIfNeeded()
       }
}

//
//  MyView2.swift
//  Runner
//
//  Created by Phuoc on 9/30/20.
//

import Foundation
class MyView: UIView {
    var text : String = "card name ios"
    var type : String = "minion"
    var textSize: CGFloat = 20
    public func setTextOnPath(text: String, type: String, textSize: CGFloat){
        self.text = text
        self.type = type
        self.textSize = textSize
    }
    override func draw(_ rect: CGRect) {
           guard let context = UIGraphicsGetCurrentContext() else { return }
           let size = self.bounds.size
        let height = size.height;
        let width = size.width;
        //print(height , " : " ,width);
        let bezierPath = UIBezierPath()
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        switch type {
        case "minion":
            bezierPath.move(to: CGPoint(x: (0/611)*width, y: (125/165)*height))
            bezierPath.addCurve(to: CGPoint(x:(611/611)*width, y: (125/165)*height),
                                controlPoint1: CGPoint(x: (90/611)*width, y: (170/165)*height),
                                controlPoint2: CGPoint(x:(450/611)*width, y: (15/165)*height))
            break
        case "spell":
            bezierPath.move(to: CGPoint(x: (0/611)*width, y: (150/165)*height))
            bezierPath.addCurve(to: CGPoint(x:(611/611)*width, y: (150/165)*height),
                                controlPoint1: CGPoint(x: (186/611)*width, y: (60/165)*height),
                                controlPoint2: CGPoint(x:(425/611)*width, y: (60/165)*height))
            break
        case "hero":
            bezierPath.move(to: CGPoint(x: (0/611)*width, y: (165/165)*height))
            bezierPath.addCurve(to: CGPoint(x:(611/611)*width, y: (165/165)*height),
                                controlPoint1: CGPoint(x: (165/611)*width, y: (69/165)*height),
                                controlPoint2: CGPoint(x:(501/611)*width, y: (69/165)*height))
            break
        default:
            bezierPath.move(to: CGPoint(x: (0/611)*width, y: (125/165)*height))
            bezierPath.addCurve(to: CGPoint(x:(611/611)*width, y: (125/165)*height),
                                controlPoint1: CGPoint(x: (90/611)*width, y: (170/165)*height),
                                controlPoint2: CGPoint(x:(450/611)*width, y: (15/165)*height))
        }
        
        print("font size ios: ",textSize)
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font: UIFont(name:"BelweBT-Bold", size: textSize) as Any,
              //  NSAttributedString.Key.backgroundColor: UIColor.black,
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

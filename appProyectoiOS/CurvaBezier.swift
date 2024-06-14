//
//  CurvaBezier.swift
//  appProyectoiOS
//
//  Created by Arturo Tejeda on 07/06/24.
//

import UIKit

class CurvaBezier: UIView {
    
    var x1: CGFloat = 0
    var y1: CGFloat = 0
    var x2: CGFloat = 0
    var y2: CGFloat = 0
    var pcX1: CGFloat = 0
    var pcY1: CGFloat = 0
    var pcX2: CGFloat = 0
    var pcY2: CGFloat = 0
    var gradientTranslation: CGPoint = .zero
    
    enum CurveType {
        case cubic
        case quadratic
        case gradient
    }
    
    var curveType: CurveType = .cubic
    
    override func draw(_ rect: CGRect) {
        switch curveType {
        case .cubic:
            drawCubicBezierCurve()
        case .quadratic:
            drawQuadraticBezierCurve()
        case .gradient:
            drawGradient()
        }
    }
    
    func drawCubicBezierCurve() {
        guard x1 != 0 && y1 != 0 && x2 != 0 && y2 != 0 && pcX1 != 0 && pcY1 != 0 && pcX2 != 0 && pcY2 != 0 else { return }

                let context = UIGraphicsGetCurrentContext()
                context?.setStrokeColor(UIColor.orange.cgColor)
                context?.setLineWidth(2.0)

                let path = UIBezierPath()
                path.move(to: CGPoint(x: x1, y: y1))
        path.addCurve(to: CGPoint(x: y1, y: y2), controlPoint1: CGPoint(x: pcX1, y: pcY1), controlPoint2: CGPoint(x: pcX2, y: pcY2))
                path.stroke()
        
        
    }
    
    func drawQuadraticBezierCurve() {
        guard x1 != 0 && y1 != 0 && x2 != 0 && y2 != 0 else { return }

        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.orange.cgColor)
        context?.setLineWidth(2.0)

        let path = UIBezierPath()
        path.move(to: CGPoint(x: x1, y: y1))
        path.addQuadCurve(to: CGPoint(x: x2, y: y2), controlPoint: CGPoint(x: pcX1, y: pcY1))
        
        path.stroke()
    }
    
    func drawGradient() {
        let context = UIGraphicsGetCurrentContext()
        let colors = [UIColor.orange.cgColor, UIColor.yellow.cgColor] as CFArray
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil)!

        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let angle = atan2(gradientTranslation.y, gradientTranslation.x)
        let startPoint = CGPoint(x: center.x + cos(angle) * bounds.width / 2, y: center.y + sin(angle) * bounds.height / 2)
        let endPoint = CGPoint(x: center.x - cos(angle) * bounds.width / 2, y: center.y - sin(angle) * bounds.height / 2)

        context?.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
    }
}

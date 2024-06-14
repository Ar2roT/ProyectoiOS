//
//  Graficos2D.swift
//  appProyectoiOS
//
//  Created by Arturo Tejeda on 07/06/24.
//

import UIKit

class Graficos2D: UIViewController {
    
    var x1: CGFloat = 0
    var y1: CGFloat = 0
    var x2: CGFloat = 0
    var y2: CGFloat = 0
    var pcX1: CGFloat = 0
    var pcY1: CGFloat = 0
    var pcX2: CGFloat = 0
    var pcY2: CGFloat = 0
    var touchCount = 0
    
    @IBOutlet weak var canvas: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    // OUTLETS PARA CONSTRAINTS
    @IBOutlet weak var segmentedTrailing: NSLayoutConstraint!
    @IBOutlet weak var fraficosTrailing: NSLayoutConstraint!
    @IBOutlet weak var canvasTrailing: NSLayoutConstraint!
    @IBOutlet weak var canvasBotton: NSLayoutConstraint!
    @IBOutlet weak var segmentedBottom: NSLayoutConstraint!
    @IBOutlet weak var canvasLeading: NSLayoutConstraint!
    @IBOutlet weak var canvasTop: NSLayoutConstraint!
    @IBOutlet weak var graficosLeading: NSLayoutConstraint!
    @IBOutlet weak var graficosTop: NSLayoutConstraint!
    @IBOutlet weak var segmentedLeading: NSLayoutConstraint!
    @IBOutlet weak var segmentedTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.canvas.layer.cornerRadius = 15.0
        self.canvas.layer.masksToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        canvas.addGestureRecognizer(tapGesture)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        canvas.addGestureRecognizer(panGesture)
        segmentedControlValueChanged(segmentedControl)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
                case 0:
                    sender.setImage(UIImage(systemName: "alternatingcurrent")?.withTintColor(.black).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                    sender.setImage(UIImage(systemName: "point.bottomleft.forward.to.point.topright.scurvepath.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), forSegmentAt: 1)
                    sender.setImage(UIImage(systemName: "rainbow")?.withTintColor(.white, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                        
                case 1:
                    sender.setImage(UIImage(systemName: "alternatingcurrent")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                    sender.setImage(UIImage(systemName: "point.bottomleft.forward.to.point.topright.scurvepath.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), forSegmentAt: 1)
                    sender.setImage(UIImage(systemName: "rainbow")?.withTintColor(.white, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                        
                case 2:
                    sender.setImage(UIImage(systemName: "alternatingcurrent")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                    sender.setImage(UIImage(systemName: "point.bottomleft.forward.to.point.topright.scurvepath.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), forSegmentAt: 1)
                    sender.setImage(UIImage(systemName: "rainbow")?.withTintColor(.black, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                        
                default:
                    sender.setImage(UIImage(systemName: "alternatingcurrent")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                    sender.setImage(UIImage(systemName: "point.bottomleft.forward.to.point.topright.scurvepath.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), forSegmentAt: 1)
                    sender.setImage(UIImage(systemName: "rainbow")?.withTintColor(.white, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                    }
        clearCanvas()
        resetTouchData()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: canvas)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            handleBezierCurveTap(at: location)
        case 1:
            handleQuadraticBezierCurveTap(at: location)
        default:
            break
        }
    }
    
    func handleBezierCurveTap(at location: CGPoint) {
        touchCount += 1
        
        switch touchCount {
        case 1:
            x1 = location.x
            y1 = location.y
            drawPoint(at: CGPoint(x: x1, y: y1), color: .orange)
            displayCoordinates(x: x1, y: y1)
        case 2:
            x2 = location.x
            y2 = location.y
            drawPoint(at: CGPoint(x: x2, y: y2), color: .orange)
            displayCoordinates(x: x2, y: y2)
        case 3:
            pcX1 = location.x
            pcY1 = location.y
            drawPoint(at: CGPoint(x: pcX1, y: pcY1), color: .green)
            displayCoordinates(x: pcX1, y: pcY1)
        case 4:
            pcX2 = location.x
            pcY2 = location.y
            drawPoint(at: CGPoint(x: pcX2, y: pcY2), color: .green)
            drawBezierCurve()
            displayCoordinates(x: pcX2, y: pcY2)
        default:
            break
        }
        
    }
    
    func handleQuadraticBezierCurveTap(at location: CGPoint) {
        touchCount += 1
        
        switch touchCount {
        case 1:
            x1 = location.x
            y1 = location.y
            drawPoint(at: CGPoint(x: x1, y: y1), color: .orange)
            displayCoordinates(x: x1, y: y1)
        case 2:
            x2 = location.x
            y2 = location.y
            drawPoint(at: CGPoint(x: x2, y: y2), color: .orange)
            displayCoordinates(x: x2, y: y2)
        case 3:
            pcX1 = location.x
            pcY1 = location.y
            drawPoint(at: CGPoint(x: pcX2, y: pcY2), color: .green)
            drawQuadraticBezierCurve()
            displayCoordinates(x: pcX2, y: pcY2)        
        default:
            break
        }
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        if segmentedControl.selectedSegmentIndex == 2 {
            let translation = sender.translation(in: canvas)
            drawGradient(translation: translation)
        }
    }
    
    func drawPoint(at point: CGPoint, color: UIColor) {
        let pointView = UIView(frame: CGRect(x: point.x - 1.5, y: point.y - 1.5, width: 8, height: 8))
        pointView.backgroundColor = color
        pointView.layer.cornerRadius = 4
        canvas.addSubview(pointView)
    }
    
    func drawBezierCurve() {
        
        let bezierView = CurvaBezier(frame: canvas.bounds)
        bezierView.x1 = x1
        bezierView.y1 = y1
        bezierView.x2 = x2
        bezierView.y2 = y2
        bezierView.pcX1 = pcX1
        bezierView.pcY1 = pcY1
        bezierView.pcX2 = pcX2
        bezierView.pcY2 = pcY2
        bezierView.curveType = .cubic
        canvas.addSubview(bezierView)
        bezierView.setNeedsDisplay()
        
        resetTouchData()
        
    }
    
    func drawQuadraticBezierCurve() {
        let bezierView = CurvaBezier(frame: canvas.bounds)
        bezierView.x1 = x1
        bezierView.y1 = y1
        bezierView.x2 = x2
        bezierView.y2 = y2
        bezierView.pcX1 = pcX1
        bezierView.pcY1 = pcY1
        bezierView.curveType = .quadratic
        canvas.addSubview(bezierView)
        bezierView.setNeedsDisplay()
        resetTouchData()
    }
    
    func drawGradient(translation: CGPoint) {
        let gradientView = CurvaBezier(frame: canvas.bounds)
        gradientView.gradientTranslation = translation
        gradientView.curveType = .gradient
        canvas.addSubview(gradientView)
        gradientView.setNeedsDisplay()
    }
    
    func clearCanvas() {
        for subview in canvas.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func resetTouchData() {
        x1 = 0
        y1 = 0
        x2 = 0
        y2 = 0
        pcX1 = 0
        pcY1 = 0
        pcX2 = 0
        pcY2 = 0
        touchCount = 0
    }
    
    func displayCoordinates(x: CGFloat, y: CGFloat) {
        let coordinatesLabel = UILabel(frame: CGRect(x: canvas.bounds.width - 120, y: canvas.bounds.height - 30, width: 120, height: 20))
        coordinatesLabel.text = "(\(Int(x)), \(Int(y)))"
        coordinatesLabel.textColor = .black
        coordinatesLabel.textAlignment = .right
        coordinatesLabel.font = UIFont.systemFont(ofSize: 12)
        canvas.addSubview(coordinatesLabel)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            self.updateConstraintsForCurrentOrientation()
        }, completion: nil)
    }
    
    @objc func orientationChanged() {
        self.updateConstraintsForCurrentOrientation()
    }

    func updateConstraintsForCurrentOrientation() {
        if UIDevice.current.orientation.isLandscape {
            // CONSTRAINT PARA LANDSCAPE
            segmentedTrailing.constant = 20
            fraficosTrailing.constant = 30
            canvasTrailing.constant = 300
            canvasBotton.constant = 10
            segmentedBottom.constant = 85
            canvasLeading.constant = 16
            canvasTop.constant = 20
            graficosLeading.constant = 440
            graficosTop.constant = 17
            segmentedLeading.constant = 450
            segmentedTop.constant = 220
            
        } else if UIDevice.current.orientation.isPortrait {
            // Regresa a los constraint portrait
            segmentedTrailing.constant = 127
            fraficosTrailing.constant = 96
            canvasTrailing.constant = 16
            canvasBotton.constant = 75
            segmentedBottom.constant = 25
            canvasLeading.constant = 16
            canvasTop.constant = 96
            graficosLeading.constant = 96
            graficosTop.constant = 17
            segmentedLeading.constant = 129
            segmentedTop.constant = 654
        }
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
}

//
//  Graficos3D.swift
//  appProyectoiOS
//
//  Created by Arturo Tejeda on 08/06/24.
//

import UIKit

class Graficos3D: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var sceneView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var sliderLuzX: UISlider!
    
    @IBOutlet weak var sliderLuzY: UISlider!
    
    @IBOutlet weak var sliderLuzZ: UISlider!
    
    @IBOutlet weak var pickerMaps: UIPickerView!
    // OUTLETS PARA CONSTRAINTS
    @IBOutlet weak var labelXTrailing: NSLayoutConstraint!
    @IBOutlet weak var sliderXTrailing: NSLayoutConstraint!
    @IBOutlet weak var labelYTrailing: NSLayoutConstraint!
    @IBOutlet weak var labelLightTraiing: NSLayoutConstraint!
    @IBOutlet weak var sliderYTrailing: NSLayoutConstraint!
    @IBOutlet weak var label3DGTrailing: NSLayoutConstraint!
    @IBOutlet weak var labelZTrailing: NSLayoutConstraint!
    @IBOutlet weak var segmentedTrailing: NSLayoutConstraint!
    @IBOutlet weak var sliderZTrailing: NSLayoutConstraint!
    @IBOutlet weak var sceneTrailing: NSLayoutConstraint!
    @IBOutlet weak var sceneBotton: NSLayoutConstraint!
    @IBOutlet weak var segmentedBottom: NSLayoutConstraint!
    @IBOutlet weak var labelLightBottom: NSLayoutConstraint!
    @IBOutlet weak var sliderZBottom: NSLayoutConstraint!
    @IBOutlet weak var sliderLuzYbottom: NSLayoutConstraint!
    @IBOutlet weak var sliderLuzXBottom: NSLayoutConstraint!
    @IBOutlet weak var labelZBottom: NSLayoutConstraint!
    @IBOutlet weak var labelYBottom: NSLayoutConstraint!
    @IBOutlet weak var labelXBottom: NSLayoutConstraint!
    @IBOutlet weak var sceneLeading: NSLayoutConstraint!
    @IBOutlet weak var sceneTop: NSLayoutConstraint!
    @IBOutlet weak var label3dGLeading: NSLayoutConstraint!
    @IBOutlet weak var label3DGTop: NSLayoutConstraint!
    @IBOutlet weak var segmentedLeading: NSLayoutConstraint!
    @IBOutlet weak var segmentedTop: NSLayoutConstraint!
    @IBOutlet weak var labelLightLeading: NSLayoutConstraint!
    @IBOutlet weak var labelLightTop: NSLayoutConstraint!
    @IBOutlet weak var sliderLuzXLeading: NSLayoutConstraint!
    @IBOutlet weak var sliderLuzXTop: NSLayoutConstraint!
    @IBOutlet weak var sliderLuzYLeading: NSLayoutConstraint!
    @IBOutlet weak var sliderLuzYTop: NSLayoutConstraint!
    @IBOutlet weak var sliderLuzZLeading: NSLayoutConstraint!
    @IBOutlet weak var sliderLuzZTop: NSLayoutConstraint!
    @IBOutlet weak var labelXLeading: NSLayoutConstraint!
    @IBOutlet weak var labelXTop: NSLayoutConstraint!
    @IBOutlet weak var labelYLeading: NSLayoutConstraint!
    @IBOutlet weak var labelYTop: NSLayoutConstraint!
    @IBOutlet weak var labelZLeading: NSLayoutConstraint!
    @IBOutlet weak var labelZTop: NSLayoutConstraint!
    @IBOutlet weak var pickerTop: NSLayoutConstraint!
    @IBOutlet weak var pickerLeading: NSLayoutConstraint!
    @IBOutlet weak var pickerBottom: NSLayoutConstraint!
    @IBOutlet weak var pickerTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var labelZ: UILabel!
    @IBOutlet weak var labelY: UILabel!
    @IBOutlet weak var labelX: UILabel!
    
    var escenario3D: Escenario3D!

        override func viewDidLoad() {
            super.viewDidLoad()
            setupScene()
            setupPicker()
            setupGestures()
            setupSliders()
            segmentedControl.addTarget(self, action: #selector(lightTypeChanged(_:)), for: .valueChanged)
            
            // Observa los cambios en la orientación
            NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
            pickerMaps.isHidden = true
        }
            
        func setupScene() {
            escenario3D = Escenario3D(frame: sceneView.bounds)
            sceneView.addSubview(escenario3D)
            escenario3D.dibujarObjectos3D()
        }
            
        func setupPicker() {
            pickerMaps.delegate = self
            pickerMaps.dataSource = self
        }
    
    
        @objc func lightTypeChanged(_ sender: UISegmentedControl) {
            escenario3D.changeLightType(index: sender.selectedSegmentIndex)
            switch sender.selectedSegmentIndex {
            case 0:
                sender.setImage(UIImage(systemName:"light.max")?.withTintColor(.black).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")?.withTintColor(.gray,renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "warninglight.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                sender.setImage(UIImage(systemName: "camera.metering.spot")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 3)
                sender.setImage(UIImage(systemName: "light.recessed.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 4)
                sender.setImage(UIImage(systemName: "circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 5)
                
                

                sender.setImage(UIImage(systemName: "square.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 6)
                pickerMaps.isHidden = true
                sliderLuzX.isHidden = false
                sliderLuzY.isHidden = false
                sliderLuzZ.isHidden = false
                labelX.isHidden = false
                labelY.isHidden = false
    labelZ.isHidden = false
            case 1:
                sender.setImage(UIImage(systemName:"light.max")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")?.withTintColor(.black,renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "warninglight.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                sender.setImage(UIImage(systemName: "camera.metering.spot")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 3)
                sender.setImage(UIImage(systemName: "light.recessed.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 4)
                sender.setImage(UIImage(systemName: "circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 5)
                sender.setImage(UIImage(systemName: "square.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 6)
                pickerMaps.isHidden = true
                sliderLuzX.isHidden = false
                sliderLuzY.isHidden = false
                sliderLuzZ.isHidden = false
                labelX.isHidden = false
                labelY.isHidden = false
    labelZ.isHidden = false
            case 2:
                sender.setImage(UIImage(systemName:"light.max")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")?.withTintColor(.gray,renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "warninglight.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                sender.setImage(UIImage(systemName: "camera.metering.spot")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 3)
                sender.setImage(UIImage(systemName: "light.recessed.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 4)
                sender.setImage(UIImage(systemName: "circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 5)
                sender.setImage(UIImage(systemName: "square.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 6)
                pickerMaps.isHidden = true
                sliderLuzX.isHidden = false
                sliderLuzY.isHidden = false
                sliderLuzZ.isHidden = false
                labelX.isHidden = false
                labelY.isHidden = false
    labelZ.isHidden = false
            case 3:
                sender.setImage(UIImage(systemName:"light.max")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")?.withTintColor(.gray,renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "warninglight.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                sender.setImage(UIImage(systemName: "camera.metering.spot")?.withTintColor(.black, renderingMode: .alwaysOriginal), forSegmentAt: 3)
                sender.setImage(UIImage(systemName: "light.recessed.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 4)
                sender.setImage(UIImage(systemName: "circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 5)
                sender.setImage(UIImage(systemName: "square.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 6)
                pickerMaps.isHidden = true
                sliderLuzX.isHidden = false
                sliderLuzY.isHidden = false
                sliderLuzZ.isHidden = false
                labelX.isHidden = false
                labelY.isHidden = false
    labelZ.isHidden = false
            case 4:
                sender.setImage(UIImage(systemName:"light.max")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")?.withTintColor(.gray,renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "warninglight.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                sender.setImage(UIImage(systemName: "camera.metering.spot")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 3)
                sender.setImage(UIImage(systemName: "light.recessed.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), forSegmentAt: 4)
                sender.setImage(UIImage(systemName: "circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 5)
                sender.setImage(UIImage(systemName: "square.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 6)
               
                      
                            pickerMaps.isHidden = true
                            sliderLuzX.isHidden = false
                            sliderLuzY.isHidden = false
                            sliderLuzZ.isHidden = false
                            labelX.isHidden = false
                            labelY.isHidden = false
                labelZ.isHidden = false
                
                
            case 5:
                sender.setImage(UIImage(systemName:"light.max")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")?.withTintColor(.gray,renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "warninglight.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                sender.setImage(UIImage(systemName: "camera.metering.spot")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 3)
                sender.setImage(UIImage(systemName: "light.recessed.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 4)
                sender.setImage(UIImage(systemName: "circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), forSegmentAt: 5)
                sender.setImage(UIImage(systemName: "square.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 6)
                pickerMaps.isHidden = false
                sliderLuzX.isHidden = true
                sliderLuzY.isHidden = true
                sliderLuzZ.isHidden = true
                labelX.isHidden = true
                labelY.isHidden = true
                
    labelZ.isHidden = true
            case 6:
                sender.setImage(UIImage(systemName:"light.max")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")?.withTintColor(.gray,renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "warninglight.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                sender.setImage(UIImage(systemName: "camera.metering.spot")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 3)
                sender.setImage(UIImage(systemName: "light.recessed.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 4)
                sender.setImage(UIImage(systemName: "circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 5)
                sender.setImage(UIImage(systemName: "square.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), forSegmentAt: 6)
                pickerMaps.isHidden = true
                sliderLuzX.isHidden = false
                sliderLuzY.isHidden = false
                sliderLuzZ.isHidden = false
                labelX.isHidden = false
                labelY.isHidden = false
    labelZ.isHidden = false
            default:
                sender.setImage(UIImage(systemName:"light.max")?.withTintColor(.black).withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")?.withTintColor(.gray,renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "warninglight.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                sender.setImage(UIImage(systemName: "camera.metering.spot")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 3)
                sender.setImage(UIImage(systemName: "light.recessed.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 4)
                sender.setImage(UIImage(systemName: "circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 5)
                sender.setImage(UIImage(systemName: "square.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), forSegmentAt: 6)
                pickerMaps.isHidden = true
                sliderLuzX.isHidden = false
                sliderLuzY.isHidden = false
                sliderLuzZ.isHidden = false
                labelX.isHidden = false
                labelY.isHidden = false
    labelZ.isHidden = false

            }
        }
            
        func setupGestures() {
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
            sceneView.addGestureRecognizer(panGesture)
            
            let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
            sceneView.addGestureRecognizer(pinchGesture)
        }
            
        @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
            let translation = gesture.translation(in: sceneView)
            let adjustedTranslation = CGPoint(x: translation.x * 0.1, y: translation.y * 0.1) // Ajusta la sensibilidad del desplazamiento
            escenario3D.moveCamera(x: Float(-adjustedTranslation.x), y: Float(adjustedTranslation.y))
            gesture.setTranslation(.zero, in: sceneView) // Reinicia la traducción del gesto
        }
            
        @objc func handlePinchGesture(_ gesture: UIPinchGestureRecognizer) {
            let scale = gesture.scale
            escenario3D.zoomCamera(scale: Float(scale))
            gesture.scale = 1.0 // restablece la escala
        }
            
        func setupSliders() {
            sliderLuzX.addTarget(self, action: #selector(sliderLuzXChanged(_:)), for: .valueChanged)
            sliderLuzY.addTarget(self, action: #selector(sliderLuzYChanged(_:)), for: .valueChanged)
            sliderLuzZ.addTarget(self, action: #selector(sliderLuzZChanged(_:)), for: .valueChanged)
        }
            
        @objc func sliderLuzXChanged(_ sender: UISlider) {
            escenario3D.updateLightPosition(x: Float(sender.value), y: nil, z: nil)
        }
            
        @objc func sliderLuzYChanged(_ sender: UISlider) {
            escenario3D.updateLightPosition(x: nil, y: Float(sender.value), z: nil)
        }
            
        @objc func sliderLuzZChanged(_ sender: UISlider) {
            escenario3D.updateLightPosition(x: nil, y: nil, z: Float(sender.value))
        }

        override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            
            coordinator.animate(alongsideTransition: { _ in
                self.updateConstraintsForCurrentOrientation()
            }, completion: { _ in
                //self.escenario3D.updateSceneViewFrame()
            })
        }
        
        @objc func orientationChanged() {
            self.updateConstraintsForCurrentOrientation()
        }

    func updateConstraintsForCurrentOrientation() {
        if UIDevice.current.orientation.isLandscape {
            // CONSTRAINT PARA LANDSCAPE
            labelYTrailing.constant = 80
            labelXTrailing.constant = 30
            sliderXTrailing.constant = 5
            sliderYTrailing.constant = 5
            labelLightTraiing.constant = 30
            sliderYTrailing.constant = 5
            label3DGTrailing.constant = 127
            labelZTrailing.constant = 70
            segmentedTrailing.constant = 10
            sliderZTrailing.constant = 5
            sceneTrailing.constant = 240
            sceneBotton.constant = 5
            segmentedBottom.constant = 220
            labelLightBottom.constant = 178
            //sliderZBottom.constant = 43
            sliderLuzYbottom.constant = 43
            sliderLuzXBottom.constant = 130
            labelXBottom.constant = 127
            sceneLeading.constant = 16
            sceneTop.constant = 71
            label3dGLeading.constant = 127
            label3DGTop.constant = 12
            segmentedLeading.constant = 520
            segmentedTop.constant = 90
            labelLightLeading.constant = 540
            labelLightTop.constant = 140
            sliderLuzXLeading.constant = 520
            sliderLuzXTop.constant = 140
            sliderLuzYLeading.constant = 520
            sliderLuzYTop.constant = 170
            sliderLuzZLeading.constant = 520
            sliderLuzZTop.constant = 265
            labelXLeading.constant = 545
            labelXTop.constant = 185
            labelYLeading.constant = 595
            labelYTop.constant = 245
            labelZLeading.constant = 585
            labelZTop.constant = 300
            pickerTop.constant = 170
            pickerTrailing.constant = 0
            pickerLeading.constant = 520
            pickerBottom.constant = 33
            
        } else if UIDevice.current.orientation.isPortrait {
            // Regresa a los constraint portrait
            labelYTrailing.constant = 194.67
            labelXTrailing.constant = 311
            sliderXTrailing.constant = 263
            sliderYTrailing.constant = 194.67
            labelLightTraiing.constant = 179
            sliderYTrailing.constant = 142.67
            label3DGTrailing.constant = 127
            labelZTrailing.constant = 70
            segmentedTrailing.constant = 61
            sliderZTrailing.constant = 17
            sceneTrailing.constant = 16
            sceneBotton.constant = 175
            segmentedBottom.constant = 117
            labelLightBottom.constant = 88
            //sliderZBottom.constant = 43
            sliderLuzYbottom.constant = 43
            sliderLuzXBottom.constant = 43
            labelXBottom.constant = 7
            sceneLeading.constant = 16
            sceneTop.constant = 71
            label3dGLeading.constant = 127
            label3DGTop.constant = 12
            segmentedLeading.constant = 61
            segmentedTop.constant = 562
            labelLightLeading.constant = 179
            labelLightTop.constant = 605
            sliderLuzXLeading.constant = 15
            sliderLuzXTop.constant = 637
            sliderLuzYLeading.constant = 138
            sliderLuzYTop.constant = 637
            sliderLuzZLeading.constant = 261.33
            sliderLuzZTop.constant = 637
            labelXLeading.constant = 68
            labelXTop.constant = 682
            labelYLeading.constant = 190
            labelYTop.constant = 682
            labelZLeading.constant = 585
            labelZTop.constant = 682
            pickerTop.constant = 630
            pickerTrailing.constant = 0
            pickerLeading.constant = 0
            pickerBottom.constant = 7
            //canvas bounds
            
        }
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
    // UIPickerViewDataSource
    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return 6
        }
    
    @objc func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let options = ["heaven", "park", "hospital", "map", "sky", ""]
            return options[row]
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        escenario3D.mapeado(index: row)
    }
    
    }

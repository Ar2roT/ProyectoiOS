//
//  Conversor.swift
//  appProyectoiOS
//
//  Created by Arturo Tejeda on 06/06/24.
//

import UIKit

class Conversor: UIViewController {

    @IBOutlet weak var botonResetOutlet: UIButton!
    @IBOutlet weak var labelDisplay: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var stepper1: UIStepper!
    
    @IBOutlet weak var labelNumero: UILabel!
    
    @IBOutlet weak var labelAuxDecimal: UILabel!
    
    //OUTLEST PARA CONSTRAINTS
    @IBOutlet weak var restaTrailing: NSLayoutConstraint!
    @IBOutlet weak var resetTrailing: NSLayoutConstraint!
    @IBOutlet weak var sumaTrailing: NSLayoutConstraint!
    @IBOutlet weak var labelNumeroTrailing: NSLayoutConstraint!
    @IBOutlet weak var stepperTrailing: NSLayoutConstraint!
    @IBOutlet weak var multTrailing: NSLayoutConstraint!
    @IBOutlet weak var segmentedTrailing: NSLayoutConstraint!
    @IBOutlet weak var sliderTrailing: NSLayoutConstraint!
    @IBOutlet weak var igualTrailing: NSLayoutConstraint!
    @IBOutlet weak var divisionTrailing: NSLayoutConstraint!
    @IBOutlet weak var labelAuxTrailing: NSLayoutConstraint!
    @IBOutlet weak var displayTrailing: NSLayoutConstraint!
    @IBOutlet weak var displayBotom: NSLayoutConstraint!
    @IBOutlet weak var labelAuxBottom: NSLayoutConstraint!
    @IBOutlet weak var segmentedBottom: NSLayoutConstraint!
    @IBOutlet weak var labelNumeroBottom: NSLayoutConstraint!
    @IBOutlet weak var sliderBottom: NSLayoutConstraint!
    @IBOutlet weak var stepperBottom: NSLayoutConstraint!
    @IBOutlet weak var sumaBottom: NSLayoutConstraint!
    @IBOutlet weak var divisionBottom: NSLayoutConstraint!
    @IBOutlet weak var restaBottom: NSLayoutConstraint!
    @IBOutlet weak var multBottom: NSLayoutConstraint!
    @IBOutlet weak var igualBottom: NSLayoutConstraint!
    @IBOutlet weak var resetBottom: NSLayoutConstraint!
    @IBOutlet weak var displayLeading: NSLayoutConstraint!
    @IBOutlet weak var displayTop: NSLayoutConstraint!
    @IBOutlet weak var segmentedLeading: NSLayoutConstraint!
    @IBOutlet weak var segmentedTop: NSLayoutConstraint!
    @IBOutlet weak var labelNumeroLeading: NSLayoutConstraint!
    @IBOutlet weak var labelNumeroTop: NSLayoutConstraint!
    @IBOutlet weak var labelAuxLeading: NSLayoutConstraint!
    @IBOutlet weak var labelAuxTop: NSLayoutConstraint!
    @IBOutlet weak var sliderLeading: NSLayoutConstraint!
    @IBOutlet weak var sliderTop: NSLayoutConstraint!
    @IBOutlet weak var stepperLeading: NSLayoutConstraint!
    @IBOutlet weak var stepperTop: NSLayoutConstraint!
    @IBOutlet weak var restaLeading: NSLayoutConstraint!
    @IBOutlet weak var restaTop: NSLayoutConstraint!
    @IBOutlet weak var sumaLeading: NSLayoutConstraint!
    @IBOutlet weak var sumaTop: NSLayoutConstraint!
    @IBOutlet weak var multLeading: NSLayoutConstraint!
    @IBOutlet weak var multTop: NSLayoutConstraint!
    @IBOutlet weak var divisionLeading: NSLayoutConstraint!
    @IBOutlet weak var divisionTop: NSLayoutConstraint!
    @IBOutlet weak var resetLeading: NSLayoutConstraint!
    @IBOutlet weak var resetTop: NSLayoutConstraint!
    @IBOutlet weak var igualLeading: NSLayoutConstraint!
    @IBOutlet weak var igualTop: NSLayoutConstraint!
    
    //Variables para los numeros a operar
    var num1 : Int = 0
    var num2 : Int = 0
    var resultadoPrev : Int = 0
    var banderaOperacion : Int = 0
    var operadorPendiente: Int? = nil

    
    var banderaPrevOperacion : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelDisplay.layer.cornerRadius = 15.0
        self.labelDisplay.layer.masksToBounds = true
        segmentedControlValueChanged(segmentedControl)
        //AJUSTAR COLORES TAB BAR
        /*if let tabBarItems = self.tabBarController?.tabBar.items {
            for item in tabBarItems {
                let unselectedColor = UIColor.lightGray
                let selectedColor = UIColor.orange
                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
                if let image = item.image {
                    item.image = image.withRenderingMode(.alwaysOriginal)
                    item.selectedImage = image.withRenderingMode(.alwaysOriginal)
                }
            }
        }*/
        //AJUSTAR COLORES SEGMENTED CONTROL
       
        
        // Do any additional setup after loading the view.
        updateBackgroundColor()
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
                sender.setImage(UIImage(systemName: "01.square.fill")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "8.square")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "16.square")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                
            case 1:
                sender.setImage(UIImage(systemName: "01.square")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "8.square.fill")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "16.square")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
                
            case 2:
                sender.setImage(UIImage(systemName: "01.square")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "8.square")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "16.square.fill")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 2)
                
            default:
                sender.setImage(UIImage(systemName: "01.square")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), forSegmentAt: 0)
                sender.setImage(UIImage(systemName: "8.square")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), forSegmentAt: 1)
                sender.setImage(UIImage(systemName: "16.square")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), forSegmentAt: 2)
            }
        
    }
    
    @IBAction func slider1Moved(_ sender: UISlider) {
        labelDisplay.isHighlighted = false
        labelNumero.text = "\(String(describing: lround(Double(sender.value))))"
        stepper1.value = Double(sender.value)
        self.segmentoSeleccionado(segmentedControl)
    }
    
    @IBAction func segmentoSeleccionado(_ sender: UISegmentedControl) {
        let indice : Int = sender.selectedSegmentIndex
        var num : Int = resultadoPrev == 0 ? Int(labelNumero.text!)! : resultadoPrev
        if indice == 0
        {
            //VERIFICAR LA CONVERSION DE NUMEROS BINARIOS NEGATIVOS
            
            if num < 0
            {
                num *= -1
                num = 256 - num
            }
            let n = String(num,radix: 2)
            labelDisplay.text = n
        }
        if indice == 1
        {
            let n = String(num, radix: 8)
            labelDisplay.text = n
        }
        if indice == 2
        {
            labelDisplay.text = String(num, radix: 16)
        }
    }
    
    func formatear(){
        let indice : Int = segmentedControl.selectedSegmentIndex
        
        if indice == 0
        {
            //VERIFICAR LA CONVERSION DE NUMEROS BINARIOS NEGATIVOS
            
            if resultadoPrev < 0
            {
                resultadoPrev *= -1
                resultadoPrev = 256 - resultadoPrev
            }
            let n = String(resultadoPrev,radix: 2)
            labelDisplay.text = n
        }
        if indice == 1
        {
            let n = String(resultadoPrev, radix: 8)
            labelDisplay.text = n
        }
        if indice == 2
        {
            labelDisplay.text = String(resultadoPrev, radix: 16)
        }
    }
    
    
    @IBAction func botonResta(_ sender: UIButton) {
        labelDisplay.isHighlighted = false
        performOperation(newOperation: 1)
    }
    
    @IBAction func botonResultado(_ sender: UIButton) {
        labelDisplay.isHighlighted = false
        labelDisplay.isHighlighted = false

        if num2 == 0 {
            num2 = Int(slider1.value)
        }

        realizarOperacion()
        operadorPendiente = nil // Resetear el operador pendiente
        slider1.value = 0
        stepper1.value = 0
        labelNumero.text = String(Int(slider1.value))
    }
    
    func realizarOperacion(){
        guard let operadorPendiente = operadorPendiente else { return }

        switch operadorPendiente {
        case 1:
            resultadoPrev = num1 - num2
        case 2:
            resultadoPrev = num1 + num2
        case 3:
            resultadoPrev = num1 * num2
        case 4:
            resultadoPrev = num1 / num2
        default:
            resultadoPrev = 0
        }

        labelDisplay.text = String(resultadoPrev)
        labelAuxDecimal.text = String(resultadoPrev) + " x10"
        banderaPrevOperacion = operadorPendiente
        self.operadorPendiente = nil
        banderaOperacion = 0
        num2 = 0
        labelDisplay.isHighlighted = true
        formatear()
    }
    
    @IBAction func stepper1Changed(_ sender: UIStepper) {
        labelDisplay.isHighlighted = false
        labelNumero.text = "\(String(describing: lround(Double(sender.value))))"
        slider1.value = Float(Double(stepper1.value))
        
        self.segmentoSeleccionado(segmentedControl)
    }
    
    @IBAction func botonAC(_ sender: UIButton) {
        num1 = 0
        num2 = 0
        resultadoPrev = 0
        labelDisplay.isHighlighted = false
        labelDisplay.text = "0"
        labelAuxDecimal.text = ""
        slider1.value = 0
        stepper1.value = 0
        labelNumero.text = String(Int(slider1.value))
    }
    
    
    @IBAction func botonSuma(_ sender: UIButton) {
        labelDisplay.isHighlighted = false
        performOperation(newOperation: 2)
    }
    
    @IBAction func botonMult(_ sender: UIButton) {
        labelDisplay.isHighlighted = false
        performOperation(newOperation: 3)
    }
    
    @IBAction func botonDiv(_ sender: UIButton) {
        labelDisplay.isHighlighted = false
        performOperation(newOperation: 4)
    }
    func performOperation(newOperation: Int) {
        labelDisplay.isHighlighted = false

        // Si ya hay un operador pendiente, realizar la operación pendiente antes de cambiar el operador
        if let operadorPendiente = operadorPendiente {
            if num2 == 0 {
                num2 = Int(slider1.value)
            }
            realizarOperacion()
            num1 = resultadoPrev
        } else {
            num1 = num1 == 0 ? Int(slider1.value) : num1
        }
        
        operadorPendiente = newOperation
        num2 = 0
        slider1.value = 0
        stepper1.value = 0
        labelNumero.text = String(Int(slider1.value))
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
            restaTrailing.constant = 389
            resetTrailing.constant = 99
            sumaTrailing.constant = 285
            labelNumeroTrailing.constant = 559
            stepperTrailing.constant = 570
            multTrailing.constant = 389
            segmentedTrailing.constant = 209
            sliderTrailing.constant = 521
            igualTrailing.constant = 99
            divisionTrailing.constant = 285
            labelAuxTrailing.constant = 16
            displayTrailing.constant = 16
            displayBotom.constant = 271
            labelAuxBottom.constant = 220
            segmentedBottom.constant = 221
            labelNumeroBottom.constant = 186
            sliderBottom.constant = 148
            stepperBottom.constant = 100
            sumaBottom.constant = 134
            divisionBottom.constant = 69
            restaBottom.constant = 134
            multBottom.constant = 69
            igualBottom.constant = 31
            resetBottom.constant = 111
            displayLeading.constant = 16
            displayTop.constant = 20
            segmentedLeading.constant = 210
            segmentedTop.constant = 79
            labelNumeroLeading.constant = 62
            labelNumeroTop.constant = 120
            labelAuxLeading.constant = 550
            labelAuxTop.constant = 80
            sliderLeading.constant = 16
            sliderTop.constant = 162
            stepperLeading.constant = 70
            stepperTop.constant = 200
            restaLeading.constant = 261
            restaTop.constant = 157
            sumaLeading.constant = 365
            sumaTop.constant = 157
            multLeading.constant = 261
            multTop.constant = 222
            divisionLeading.constant = 365
            divisionTop.constant = 222
            resetLeading.constant = 499
            resetTop.constant = 157
            igualLeading.constant = 499
            igualTop.constant = 237
            
  
            
        } else if UIDevice.current.orientation.isPortrait {
            // Regresa a los constraint portrait
            restaTrailing.constant = 278
            resetTrailing.constant = 206
            sumaTrailing.constant = 206
            labelNumeroTrailing.constant = 157
            stepperTrailing.constant = 149
            multTrailing.constant = 135
            segmentedTrailing.constant = 131
            sliderTrailing.constant = 112
            igualTrailing.constant = 99
            divisionTrailing.constant = 63
            labelAuxTrailing.constant = 16
            displayTrailing.constant = 16
            displayBotom.constant = 624
            labelAuxBottom.constant = 585
            segmentedBottom.constant = 537
            labelNumeroBottom.constant = 494
            sliderBottom.constant = 439
            stepperBottom.constant = 393
            sumaBottom.constant = 296
            divisionBottom.constant = 296
            restaBottom.constant = 296
            multBottom.constant = 296
            igualBottom.constant = 219
            resetBottom.constant = 219
            displayLeading.constant = 16
            displayTop.constant = 22
            segmentedLeading.constant = 148
            segmentedTop.constant = 142
            labelNumeroLeading.constant = 156
            labelNumeroTop.constant = 195
            labelAuxLeading.constant = 277
            labelAuxTop.constant = 94
            sliderLeading.constant = 112
            sliderTop.constant = 241
            stepperLeading.constant = 149
            stepperTop.constant = 285
            restaLeading.constant = 62
            restaTop.constant = 361
            sumaLeading.constant = 134
            sumaTop.constant = 360
            multLeading.constant = 205
            multTop.constant = 362
            divisionLeading.constant = 277
            divisionTop.constant = 360
            resetLeading.constant = 98
            resetTop.constant = 438
            igualLeading.constant = 205
            igualTop.constant = 438
            
            
        }
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            super.traitCollectionDidChange(previousTraitCollection)
        
            // Verificar si el cambio es relevante (cambio de modo de interfaz de usuario)
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                updateBackgroundColor()
            }
        }
        
        private func updateBackgroundColor() {
            
        }
    
    /*
    // MARK: - Navigation|

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

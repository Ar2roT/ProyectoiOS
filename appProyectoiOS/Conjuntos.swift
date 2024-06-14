//
//  Conjuntos.swift
//  appProyectoiOS
//
//  Created by Arturo Tejeda on 07/06/24.
//

import UIKit

class Conjuntos: UIViewController {

    //OUTLETS PARA CONSTRAINTS
    @IBOutlet weak var segmentedTrailing: NSLayoutConstraint!
    @IBOutlet weak var conjuntosTrailing: NSLayoutConstraint!
    @IBOutlet weak var labelResultadoTrailing: NSLayoutConstraint!
    @IBOutlet weak var conjunto2Trailing: NSLayoutConstraint!
    @IBOutlet weak var conjunto1Trailing: NSLayoutConstraint!
    @IBOutlet weak var buttonTrailing: NSLayoutConstraint!
    @IBOutlet weak var conjuntosBottom: NSLayoutConstraint!
    @IBOutlet weak var labelResultadoBottom: NSLayoutConstraint!
    @IBOutlet weak var conjuntosLeading: NSLayoutConstraint!
    @IBOutlet weak var conjuntosTop: NSLayoutConstraint!
    @IBOutlet weak var conjunto1Leading: NSLayoutConstraint!
    @IBOutlet weak var conjunto1Top: NSLayoutConstraint!
    @IBOutlet weak var segmentedLeading: NSLayoutConstraint!
    @IBOutlet weak var segmententedTop: NSLayoutConstraint!
    @IBOutlet weak var conjunto2Leading: NSLayoutConstraint!
    @IBOutlet weak var conjunto2Top: NSLayoutConstraint!
    @IBOutlet weak var labelResultadoLeading: NSLayoutConstraint!
    @IBOutlet weak var labelResultadoTop: NSLayoutConstraint!
    @IBOutlet weak var buttomLeading: NSLayoutConstraint!
    @IBOutlet weak var buttomTop: NSLayoutConstraint!
    
    
    var set1: Set<String> = []
    var set2: Set<String> = []
    
    @IBOutlet weak var conjunto1: UITextField!
    @IBOutlet weak var conjunto2: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var labelResultado: UILabel!
    
    @IBAction func botonSwap(_ sender: UIButton) {
        let temp = conjunto1.text
        conjunto1.text = conjunto2.text
        conjunto2.text = temp
        actualizarConjuntos()
        realizarOperacion()
    }

    @IBAction func textFieldEditingChanged(_ textField: UITextField) {
        actualizarConjuntos()
        realizarOperacion()
    }

    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        realizarOperacion()
    }

    override func viewDidLoad() {
            super.viewDidLoad()
            conjunto1.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
            conjunto2.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }

        func actualizarConjuntos() {
            set1 = convertirACojunto(texto: conjunto1.text ?? "")
            set2 = convertirACojunto(texto: conjunto2.text ?? "")
        }

        func convertirACojunto(texto: String) -> Set<String> {
            let elementos = texto.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
            return Set(elementos)
        }

        func realizarOperacion() {
            var resultado: String = ""

            switch segmentedControl.selectedSegmentIndex {
            case 0:
                resultado = set1.union(set2).sorted().joined(separator: ", ")
            case 1:
                resultado = set1.intersection(set2).sorted().joined(separator: ", ")
            case 2:
                resultado = set1.subtracting(set2).sorted().joined(separator: ", ")
            case 3:
                resultado = set1.symmetricDifference(set2).sorted().joined(separator: ", ")
            case 4:
                resultado = set1.isSubset(of: set2) ? "Set1 ⊆ Set2" : "Set1 ⊈ Set2"
            case 5:
                resultado = set1.isSuperset(of: set2) ? "Set1 ⊇ Set2" : "Set1 ⊉ Set2"
            default:
                break
            }

            labelResultado.text = resultado
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
            segmentedTrailing.constant = 0
            conjuntosTrailing.constant = 30
            labelResultadoTrailing.constant = 25
            conjunto2Trailing.constant = 25
            conjunto1Trailing.constant = 25
            buttonTrailing.constant = 16
            conjuntosBottom.constant = 270
            labelResultadoBottom.constant = 0
            conjuntosLeading.constant = 117
            conjuntosTop.constant = 31
            conjunto1Leading.constant = 16
            conjunto1Top.constant = 90
            segmentedLeading.constant = 0
            segmententedTop.constant = 15
            conjunto2Leading.constant = 16
            conjunto2Top.constant = 69
            labelResultadoLeading.constant = 16
            labelResultadoTop.constant = 230
            buttomLeading.constant = 650
            buttomTop.constant = 50
            
        } else if UIDevice.current.orientation.isPortrait {
            // Regresa a los constraint portrait
            segmentedTrailing.constant = 0
            conjuntosTrailing.constant = 118
            labelResultadoTrailing.constant = 25
            conjunto2Trailing.constant = 25
            conjunto1Trailing.constant = 25
            buttonTrailing.constant = 16
            conjuntosBottom.constant = 636
            labelResultadoBottom.constant = 125
            conjuntosLeading.constant = 117
            conjuntosTop.constant = 31
            conjunto1Leading.constant = 16
            conjunto1Top.constant = 147
            segmentedLeading.constant = 0
            segmententedTop.constant = 34
            conjunto2Leading.constant = 16
            conjunto2Top.constant = 98.67
            labelResultadoLeading.constant = 16
            labelResultadoTop.constant = 438
            buttomLeading.constant = 319
            buttomTop.constant = 350
            
        }
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
    
}

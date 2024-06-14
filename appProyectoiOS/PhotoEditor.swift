import UIKit

class PhotoEditor: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    //Outlets constraint
    
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var redSliderConstraintTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var blueSliderConstraintTrailing: NSLayoutConstraint!
    @IBOutlet weak var greenSliderConstraintTrailing: NSLayoutConstraint!
    @IBOutlet weak var imageEditorTrailing: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var blueSliderBotton: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeading: NSLayoutConstraint!
    @IBOutlet weak var imageEditorTop: NSLayoutConstraint!
    @IBOutlet weak var imageEditorLeading: NSLayoutConstraint!
    @IBOutlet weak var imgaeEditorTop: NSLayoutConstraint!
    @IBOutlet weak var redSliderLeading: NSLayoutConstraint!
    @IBOutlet weak var greenSliderLeading: NSLayoutConstraint!
    @IBOutlet weak var greenSliderTop: NSLayoutConstraint!
    @IBOutlet weak var blueSliderLeading: NSLayoutConstraint!
    @IBOutlet weak var blueSliderTop: NSLayoutConstraint!
    var originalImage: UIImage?
           
       override func viewDidLoad() {
           super.viewDidLoad()
           self.imageView.layer.cornerRadius = 15.0
           // Inicializar los sliders
           redSlider.minimumValue = 0
           redSlider.maximumValue = 1
           greenSlider.minimumValue = 0
           greenSlider.maximumValue = 1
           blueSlider.minimumValue = 0
           blueSlider.maximumValue = 1
           
           // Añadir acciones a los sliders
           redSlider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
           greenSlider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
           blueSlider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
           
           // Habilitar la interacción con la imageView
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
           imageView.isUserInteractionEnabled = true
           imageView.addGestureRecognizer(tapGesture)
           
           // Agregar observador para cambios de orientación
           NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
       }
       
       @objc func selectImage() {
           let imagePickerController = UIImagePickerController()
           imagePickerController.delegate = self
           imagePickerController.sourceType = .photoLibrary
           present(imagePickerController, animated: true, completion: nil)
       }
       
       // UIImagePickerControllerDelegate
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let image = info[.originalImage] as? UIImage {
               imageView.image = image
               originalImage = image
               setSlidersToImageValues(image: image)
           }
           picker.dismiss(animated: true, completion: nil)
       }
       
       @objc func sliderChanged(_ sender: UISlider) {
           adjustImageColor()
       }
       
       func setSlidersToImageValues(image: UIImage) {
           guard let cgImage = image.cgImage else { return }
           let pixelData = cgImage.dataProvider?.data
           let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
           
           let pixelInfo: Int = ((Int(image.size.width) * Int(image.size.height) / 2) * 4)
           
           let r = CGFloat(data[pixelInfo]) / 255.0
           let g = CGFloat(data[pixelInfo + 1]) / 255.0
           let b = CGFloat(data[pixelInfo + 2]) / 255.0
           
           redSlider.value = Float(r)
           greenSlider.value = Float(g)
           blueSlider.value = Float(b)
       }
       
       func adjustImageColor() {
           guard let originalImage = originalImage else { return }
           
           let ciImage = CIImage(image: originalImage)
           let context = CIContext(options: nil)
           
           let filter = CIFilter(name: "CIColorMatrix")
           filter?.setValue(ciImage, forKey: kCIInputImageKey)
           
           // Ajustar los valores de los colores
           let redValue = redSlider.value
           let greenValue = greenSlider.value
           let blueValue = blueSlider.value
           
           filter?.setValue(CIVector(x: CGFloat(redValue), y: 0, z: 0, w: 0), forKey: "inputRVector")
           filter?.setValue(CIVector(x: 0, y: CGFloat(greenValue), z: 0, w: 0), forKey: "inputGVector")
           filter?.setValue(CIVector(x: 0, y: 0, z: CGFloat(blueValue), w: 0), forKey: "inputBVector")
           
           if let output = filter?.outputImage,
              let cgImage = context.createCGImage(output, from: output.extent) {
               let processedImage = UIImage(cgImage: cgImage)
               imageView.image = processedImage
           }
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
               redSliderConstraintTrailing.constant = 50
               greenSliderConstraintTrailing.constant = 50
               blueSliderConstraintTrailing.constant = 50
               imageEditorTrailing.constant = 115
               imageViewTrailing.constant = 250
               imageViewBottomConstraint.constant = 10
               blueSliderBotton.constant = 69
               imageViewLeading.constant = 16
               imageEditorTop.constant = 37
               imageEditorLeading.constant = 115
               imgaeEditorTop.constant = 40
               redSliderLeading.constant = 500
               greenSliderLeading.constant = 500
               blueSliderLeading.constant = 500
               greenSliderTop.constant = 21
               blueSliderTop.constant = 21
           } else if UIDevice.current.orientation.isPortrait {
               // Regresa a los constraint portrait
               redSliderConstraintTrailing.constant = 104
               greenSliderConstraintTrailing.constant = 104
               blueSliderConstraintTrailing.constant = 104
               imageEditorTrailing.constant = 115
               imageViewTrailing.constant = 16
               imageViewBottomConstraint.constant = 218
               blueSliderBotton.constant = 69
               imageViewLeading.constant = 16
               imageEditorTop.constant = 37
               imageEditorLeading.constant = 115
               imgaeEditorTop.constant = 40
               redSliderLeading.constant = 104
               greenSliderLeading.constant = 104
               blueSliderLeading.constant = 104
               greenSliderTop.constant = 21
               blueSliderTop.constant = 21
           }
           self.view.setNeedsLayout()
           self.view.layoutIfNeeded()
       }
   }

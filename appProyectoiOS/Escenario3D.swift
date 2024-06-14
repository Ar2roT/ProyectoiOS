import UIKit
import SceneKit

class Escenario3D: UIView {
    
    var scene: SCNScene!
    var cameraNode: SCNNode!
    var lightNode: SCNNode!
    var cubeNode: SCNNode!
    var bicycleNode: SCNNode!
    var sphereNode: SCNNode!
    var scnView: SCNView!
    var mapName: String = "heaven"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15.0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func dibujarObjectos3D() {
        scnView = SCNView(frame: self.bounds)
        self.addSubview(scnView)
        
        // CREAMOS LA ESCENA
        scene = SCNScene()
        scnView.scene = scene
        
        // CREAR LA CÁMARA
        let camara = SCNCamera()
        cameraNode = SCNNode()
        cameraNode.camera = camara
        
        // VISTA
        cameraNode.position = SCNVector3(0, 5, 10)
        
        // CREAR LA LUZ PARA MANEJAR DIFERENTES TIPOS
        let luz = SCNLight()
        luz.type = .ambient
        luz.intensity = 5000
        luz.areaExtents = simd_float3(5, 5, 0.1)
        luz.areaType = .rectangle
        luz.castsShadow = true
        luz.shadowColor = UIColor.black.withAlphaComponent(0.75)
        
        // CREAMOS EL NODO PARA LA LUZ
        lightNode = SCNNode()
        lightNode.light = luz
        lightNode.position = SCNVector3(0, 5, 0) // Posición inicial de la luz
        lightNode.eulerAngles = SCNVector3(-Float.pi / 2, 0, 0) // Orientar hacia abajo
        
        // OBJETO CUBO
        let geometriaCubo = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
        cubeNode = SCNNode(geometry: geometriaCubo)
        
        // COLOR DEL CUBO
        let materialCubo = SCNMaterial()
        materialCubo.diffuse.contents = UIColor.systemPink
        materialCubo.specular.contents = UIColor.white
        materialCubo.lightingModel = .physicallyBased
        geometriaCubo.materials = [materialCubo]
        cubeNode.position = SCNVector3(0.5, 0, 0)
        
        // DIBUJAR UNA ESFERA
        let sphereGeometry = SCNSphere(radius: 0.5)
        sphereNode = SCNNode(geometry: sphereGeometry)
        
        // CONFIGURAR MATERIAL COMO CRISTAL
        let materialEsfera = SCNMaterial()
        materialEsfera.diffuse.contents = UIColor.systemCyan.withAlphaComponent(0.2)
        materialEsfera.specular.contents = UIColor.white
        materialEsfera.transparency = 0.8
        materialEsfera.reflective.contents = UIColor.white
        materialEsfera.fresnelExponent = 1.5
        materialEsfera.lightingModel = .physicallyBased
        sphereGeometry.materials = [materialEsfera]
        
        sphereNode.position = SCNVector3(2.0, 0, 0)
        
        // PLANO O PISO
        let planoGeometria = SCNPlane(width: 50/3, height: 50/3)
        let planoNodo = SCNNode(geometry: planoGeometria)
        
        planoNodo.eulerAngles = SCNVector3(GLKMathDegreesToRadians(-90), 0, 0)
        planoNodo.position = SCNVector3(0.0, -0.5, 0)
        
        // COLOR MATERIAL Y PLANO
        let materialPlano = SCNMaterial()
        materialPlano.diffuse.contents = UIColor.systemGray
        materialPlano.specular.contents = UIColor.white
        materialPlano.lightingModel = .physicallyBased
        planoGeometria.materials = [materialPlano]
        
        // BICICLETA
        crearBicicleta()
        
        // AGREGAMOS LOS NODOS
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(cubeNode)
        scene.rootNode.addChildNode(sphereNode)
        scene.rootNode.addChildNode(planoNodo)
        scene.rootNode.addChildNode(bicycleNode)
        
        scnView.allowsCameraControl = false
        scnView.autoenablesDefaultLighting = false
        scnView.backgroundColor = UIColor.black
    }
    
    func crearBicicleta() {
        bicycleNode = SCNNode()
        
        // Ruedas de la bicicleta
        let ruedaGeometria = SCNTorus(ringRadius: 0.3, pipeRadius: 0.05)
        let materialRueda = SCNMaterial()
        materialRueda.diffuse.contents = UIColor.systemMint
        materialRueda.specular.contents = UIColor.white
        materialRueda.lightingModel = .physicallyBased
        ruedaGeometria.materials = [materialRueda]
        
        let ruedaDelanteraNode = SCNNode(geometry: ruedaGeometria)
        ruedaDelanteraNode.position = SCNVector3(0.7, 0.75, 0)
        ruedaDelanteraNode.eulerAngles = SCNVector3(GLKMathDegreesToRadians(90), 0, 0)
        
        let ruedaTraseraNode = SCNNode(geometry: ruedaGeometria)
        ruedaTraseraNode.position = SCNVector3(-0.7, 0.75, 0)
        ruedaTraseraNode.eulerAngles = SCNVector3(GLKMathDegreesToRadians(90), 0, 0)
        
        // Marco de la bicicleta
        let marcoGeometria = SCNCylinder(radius: 0.02, height: 1.4)
        let materialMarco = SCNMaterial()
        materialMarco.diffuse.contents = UIColor.blue
        materialMarco.specular.contents = UIColor.white
        materialMarco.lightingModel = .physicallyBased
        marcoGeometria.materials = [materialMarco]
        
        let marcoNode = SCNNode(geometry: marcoGeometria)
        marcoNode.position = SCNVector3(0, 0.95, 0)
        marcoNode.eulerAngles = SCNVector3(0, 0, GLKMathDegreesToRadians(45))
        
        // Manubrio de la bicicleta
        let manubrioGeometria = SCNCylinder(radius: 0.02, height: 0.6)
        let materialManubrio = SCNMaterial()
        materialManubrio.diffuse.contents = UIColor.red
        materialManubrio.specular.contents = UIColor.white
        materialManubrio.lightingModel = .physicallyBased
        manubrioGeometria.materials = [materialManubrio]
        
        let manubrioNode = SCNNode(geometry: manubrioGeometria)
        manubrioNode.position = SCNVector3(0.7, 1.2, 0)
        manubrioNode.eulerAngles = SCNVector3(0, 0, GLKMathDegreesToRadians(90))
        
        // Asiento de la bicicleta
        let sillonGeometria = SCNBox(width: 0.3, height: 0.02, length: 0.2, chamferRadius: 0)
        let materialSillon = SCNMaterial()
        materialSillon.diffuse.contents = UIColor.brown
        materialSillon.specular.contents = UIColor.white
        materialSillon.lightingModel = .physicallyBased
        sillonGeometria.materials = [materialSillon]
        
        let sillonNode = SCNNode(geometry: sillonGeometria)
        sillonNode.position = SCNVector3(-0.39, 1.45, 0)
        
        // Agregar los componentes a la bicicleta
        bicycleNode.addChildNode(ruedaDelanteraNode)
        bicycleNode.addChildNode(ruedaTraseraNode)
        bicycleNode.addChildNode(marcoNode)
        bicycleNode.addChildNode(manubrioNode)
        bicycleNode.addChildNode(sillonNode)
        
        bicycleNode.position = SCNVector3(0.5, 0, 0)
    }
    
    func changeLightType(index: Int) {
        guard let light = lightNode.light else {
            print("La luz no está inicializada")
            return
        }
        light.intensity = 2000
        switch index {
        case 0:
            light.type = .ambient
            lightNode.position = SCNVector3(0, 10, 0) // Posición estándar
            resetEnvironmentMap()
        case 1:
            light.type = .directional
            lightNode.position = SCNVector3(0, 10, 10)
            lightNode.eulerAngles = SCNVector3(-Float.pi / 2, 10, 0) // Asegurando dirección correcta
            resetEnvironmentMap()
        case 2:
            light.type = .omni
            lightNode.position = SCNVector3(0, 10, 10)
            resetEnvironmentMap()
        case 3:
            // Ajuste para luz spot
            light.type = .spot
            lightNode.position = SCNVector3(1.25, 5, 1) // Ajuste la posición para iluminar los objetos
            lightNode.look(at: SCNVector3(1.25, 0, 1))
            resetEnvironmentMap()
        case 4:
            // Ajuste para luz IES
            light.type = .IES
            lightNode.position = SCNVector3(1.25, 5, 1)
            lightNode.look(at: SCNVector3(1.25, 0, 1))
            resetEnvironmentMap()
        case 5:
            // Ajuste para luz probe
            light.type = .probe
            light.probeType = .irradiance
            light.intensity = 10000
            lightNode.position = SCNVector3(30, 5, 0)
            // Configurar el entorno de reflexión
            let environmentMap = UIImage(named: mapName)
            scene.lightingEnvironment.contents = environmentMap
            scene.lightingEnvironment.intensity = 1.0
            
            print("Luz probe configurada")
        case 6:
            // Ajuste para luz de área
            light.type = .area
            light.intensity = 5000 // Incrementar la intensidad
            light.areaExtents = simd_float3(5, 5, 0.1)
            light.areaType = .rectangle
            light.castsShadow = true
            light.shadowColor = UIColor.black.withAlphaComponent(0.75) // Ajustar sombra
            
            lightNode.position = SCNVector3(0, 5, 0)
            lightNode.eulerAngles = SCNVector3(-Float.pi / 2, 0, 0) // Orientar hacia abajo
            resetEnvironmentMap()
            if lightNode.light == nil {
                print("Error: la luz del nodo no está inicializada correctamente.")
            } else {
                print("Luz de área configurada correctamente.")
            }
        default:
            light.type = .ambient
            lightNode.position = SCNVector3(0, 10, 0) // Posición estándar
            resetEnvironmentMap()
        }
    }
    
    
    
    
    func mapeado(index: Int){
        
        switch index {
        case 0:
            self.mapName = "heaven"
        case 1:
            self.mapName = "park"
        case 2:
            self.mapName = "hospital"
        case 3:
            self.mapName = "map"
        case 4:
            self.mapName = "sky"
        case 5:
            self.mapName = "hotel"
        case 6:
            self.mapName = "sky"
        default:
            self.mapName = "sky"
        }
        changeLightType(index: 5)
        
        
    }
    
    func resetEnvironmentMap() {
        scene.lightingEnvironment.contents = nil
    }
    
    func moveCamera(x: Float, y: Float) {
        cameraNode.position.x += x
        cameraNode.position.y += y
    }
    
    func zoomCamera(scale: Float) {
        cameraNode.position.z += (1 - scale) * 0.5
    }
    
    func updateLightPosition(x: Float?, y: Float?, z: Float?) {
        if let x = x {
            lightNode.position.x = x
        }
        if let y = y {
            lightNode.position.y = y
        }
        if let z = z {
            lightNode.position.z = z
        }
        
        if lightNode.light?.type == .directional {
            let direction = SCNVector3(lightNode.position.x, -(lightNode.position.y), -(lightNode.position.z))
            lightNode.eulerAngles = SCNVector3(
                asin(direction.y / sqrt(direction.x * direction.x + direction.y * direction.y + direction.z * direction.z)),
                atan2(direction.x, direction.z),
                0
            )
        }
    }
}
    



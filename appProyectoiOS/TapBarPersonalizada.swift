//
//  TapBarPersonalizada.swift
//  appProyectoiOS
//
//  Created by Arturo Tejeda on 07/06/24.
//

import UIKit

class TapBarPersonalizada: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        updateTabBarItemColors(selectedIndex: self.selectedIndex)

        // Forzar la carga de los view controllers hijos
        forceLoadChildViewControllers()
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateTabBarItemColors(selectedIndex: tabBarController.selectedIndex)
    }

    private func updateTabBarItemColors(selectedIndex: Int) {
        guard let tabBarItems = self.tabBar.items else { return }
        
        for (index, item) in tabBarItems.enumerated() {
            let unselectedColor = UIColor.lightGray
            
            switch index {
            case 0:
                // Configuración para el primer ítem
                let selectedColor = UIColor.orange
                if index == selectedIndex {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                    }
                } else {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                    }
                }
                
            case 1:
                // Configuración para el segundo ítem
                let selectedColor = UIColor.white
                if index == selectedIndex {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                    }
                } else {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                    }
                }
                
            // Agregar configuraciones adicionales aquí para más ítems en el futuro
            case 2:
                let selectedColor = UIColor.white
                if index == selectedIndex {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                    }
                } else {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                    }
                }
                break
                
            case 3:
                let selectedColor = UIColor.systemMint
                if index == selectedIndex {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                    }
                } else {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                    }
                }
                break
                
            case 4:
                let selectedColor = UIColor.yellow
                if index == selectedIndex {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                    }
                } else {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                    }
                }
                break
                case 5:
                let selectedColor = UIColor.systemIndigo
                if index == selectedIndex {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(selectedColor)
                    }
                } else {
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
                    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .selected)
                    if let image = item.image {
                        item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                        item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                    }
                }
                break
            default:
                // Configuración por defecto (opcional)
                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .selected)
                if let image = item.image {
                    item.image = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                    item.selectedImage = image.withRenderingMode(.alwaysOriginal).withTintColor(unselectedColor)
                }
            }
        }
    }

    private func forceLoadChildViewControllers() {
        guard let viewControllers = self.viewControllers else { return }
        for viewController in viewControllers {
            _ = viewController.view
        }
    }
}

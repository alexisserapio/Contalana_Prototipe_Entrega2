//
//  addProductViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 05/10/25.
//

import UIKit

class addProductViewController: UIViewController {
    
    let formButton = UIButton(type: .system)
    let addedLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "productExists")
        
        
        view.backgroundColor = UIColor.backgroundTint
        // Informative Button
        view.addSubview(formButton)
        formButton.setTitle("informative.button".localized, for: .normal)
        formButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        formButton.setTitleColor(.white, for: .normal)
        formButton.backgroundColor = .init(named: "CL_darkBlue")
        formButton.layer.cornerRadius = 18
        formButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            formButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            formButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            formButton.widthAnchor.constraint(equalToConstant: 350),
            formButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(addedLabel)
        
        addedLabel.text = "inventoryScene.addedProduct".localized
        addedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let botonIzquierdo = UIBarButtonItem(
                    image: UIImage(systemName: "chevron.backward"),
                    style: .plain,
                    target: self,
                    action: #selector(cerrarVista)
                )
        self.navigationItem.leftBarButtonItem = botonIzquierdo

    }
    
    @objc func cerrarVista() {
            // Esto solo funciona si estás en un stack de navegación
        self.dismiss(animated: true)
            
            // O si fue presentado modalmente (ver sección 2)
            // dismiss(animated: true)
        }
        // Do any additional setup after loading the view.
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  signInViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 05/10/25.
//

import UIKit

class signInViewController: UIViewController {
    
    let buildingImage = UIImageView()
    let buildingLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroundTint
        
        view.addSubview(buildingImage)
        view.addSubview(buildingLabel)
        buildingImage.image = UIImage(systemName: "figure.skateboarding")
        buildingImage.translatesAutoresizingMaskIntoConstraints = false
        buildingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buildingImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        buildingLabel.text = "Work in Progress, see ya soon!"
        buildingLabel.translatesAutoresizingMaskIntoConstraints = false
        buildingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        NSLayoutConstraint.activate([
            buildingLabel.topAnchor.constraint(equalTo: buildingImage.bottomAnchor, constant: 15)
            ])
        
        
        let botonIzquierdo = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(cerrarVista)
        )
        self.navigationItem.leftBarButtonItem = botonIzquierdo
        // Do any additional setup after loading the view.
    }
    
    @objc func cerrarVista() {
        self.dismiss(animated: true)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  managementViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 05/10/25.
//

import UIKit

class managementViewController: UIViewController {

    let managementLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        
        view.backgroundColor = UIColor.backgroundTint
        
        view.addSubview(managementLabel)
        let businessName = UserDefaults.standard.string(forKey: "businessName")
        
        managementLabel.text = String(format: "managementScene.welcome".localized, businessName!)
        managementLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        managementLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            managementLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.025),
            managementLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.075),
        ])
        
    }

}

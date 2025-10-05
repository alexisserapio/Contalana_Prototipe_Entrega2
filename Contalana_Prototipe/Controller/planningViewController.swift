//
//  planningViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 05/10/25.
//

import UIKit

class planningViewController: UIViewController {

    let planningLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        
        view.backgroundColor = UIColor.backgroundTint
        
        view.addSubview(planningLabel)
        let businessName = UserDefaults.standard.string(forKey: "businessName")
        
        planningLabel.text = String(format: "planningScene.welcome".localized, businessName!)
        planningLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        planningLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planningLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.025),
            planningLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.075),
        ])
        
    }

}

//
//  mainSceneViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 04/10/25.
//

import UIKit

class mainSceneViewController: UIViewController {
    
    let mainLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        
        view.backgroundColor = UIColor.backgroundTint
        
        view.addSubview(mainLabel)
        let businessName = UserDefaults.standard.string(forKey: "businessName")
        
        mainLabel.text = String(format: "mainScene.welcome".localized, businessName!)
        mainLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.025),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.075),
        ])
        
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

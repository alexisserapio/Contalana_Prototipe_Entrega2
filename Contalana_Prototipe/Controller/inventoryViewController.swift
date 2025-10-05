//
//  inventoryViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 04/10/25.
//

import UIKit

class inventoryViewController: UIViewController {
    
    let inventoryLabel = UILabel()
    let noProductsLabel = UILabel()
    let addProductButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        let productExists = UserDefaults.standard.bool(forKey: "productExists")
        guard productExists != true else { return }
        setupUINoProducts()
        
    }
    
    func setupUI(){
        view.backgroundColor = UIColor.backgroundTint
        let businessName = UserDefaults.standard.string(forKey: "businessName")
        
        view.addSubview(inventoryLabel)
        
        inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        inventoryLabel.text = String(format: "inventoryScene.welcome".localized, businessName!)
        inventoryLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inventoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.025),
            inventoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.075),
        ])
        
    }
    
    func setupUINoProducts(){
        view.backgroundColor = UIColor.backgroundTint
        let businessName = UserDefaults.standard.string(forKey: "businessName")
        
        view.addSubview(inventoryLabel)
        
        inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        inventoryLabel.text = String(format: "inventoryScene.welcome".localized, businessName!)
        inventoryLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inventoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.025),
            inventoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.075),
        ])
        
        view.addSubview(noProductsLabel)
        
        noProductsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        noProductsLabel.text = "No hay productos en el inventario"
        noProductsLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        NSLayoutConstraint.activate([
            noProductsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noProductsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(addProductButton)
        
        addProductButton.translatesAutoresizingMaskIntoConstraints = false
        addProductButton.setTitle("Añadir producto", for: .normal)
        addProductButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        addProductButton.setTitleColor(.white, for: .normal)
        addProductButton.backgroundColor = .init(named: "CL_lightBlue")
        addProductButton.layer.cornerRadius = 18
        
        NSLayoutConstraint.activate([
            addProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addProductButton.topAnchor.constraint(equalTo: noProductsLabel.bottomAnchor, constant: view.bounds.height * 0.02),
            addProductButton.widthAnchor.constraint(equalToConstant: 200),
            addProductButton.heightAnchor.constraint(equalToConstant: 50)
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

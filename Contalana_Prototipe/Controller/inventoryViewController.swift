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
    let text = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        view.subviews.forEach { $0.removeFromSuperview() }
        let productExists = UserDefaults.standard.bool(forKey: "productExists")
        
        if productExists {
            setupUI()
        } else {
            setupUINoProducts()
        }
        
    }
    
    func setupUI(){
        
        view.backgroundColor = UIColor.backgroundTint
        let businessName = UserDefaults.standard.string(forKey: "businessName")
        
        view.addSubview(inventoryLabel)
        view.addSubview(text)
        
        inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        inventoryLabel.text = String(format: "inventoryScene.welcome".localized, businessName!)
        inventoryLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        text.text = "inventoryScene.text".localized
        text.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        NSLayoutConstraint.activate([
            inventoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.025),
            inventoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.075),
            inventoryLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
            inventoryLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
        
        view.addSubview(noProductsLabel)
        
        noProductsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        noProductsLabel.text = "inventoryScene.noProducts".localized
        noProductsLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        NSLayoutConstraint.activate([
            noProductsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noProductsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(addProductButton)
        
        addProductButton.translatesAutoresizingMaskIntoConstraints = false
        addProductButton.setTitle("inventoryScene.addProductButton".localized, for: .normal)
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(buttonTapped))
        addProductButton.addGestureRecognizer(tapGesture)
        addProductButton.isUserInteractionEnabled = true
        
    }
    
    @objc func buttonTapped() {
        print("Botón addProduct presionado")
        self.performSegue(withIdentifier: "inventorySegue", sender: self)
        
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

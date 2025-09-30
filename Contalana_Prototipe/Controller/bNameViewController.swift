//
//  bNameViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 23/08/25.
//

import UIKit

class bNameViewController: UIViewController {
    
    let bNameTitleLabel = UILabel()
    let bNameSubLabel = UILabel()
    let bNameButton = UIButton(type: .system)
    let bNameTextField = UITextField()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupBNameUI()

        // Do any additional setup after loading the view.
    }
    
    //WelcomeLabel
    func setupBNameUI(){
        //Bussiness Name View Title
        bNameTitleLabel.text = "bName.title".localized
        bNameTitleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        bNameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bNameTitleLabel.textAlignment = .center
        bNameTitleLabel.numberOfLines = 0
        bNameTitleLabel.lineBreakMode = .byWordWrapping
        view.addSubview(bNameTitleLabel)
        
        //Constraints Welcome Label
        NSLayoutConstraint.activate([
            bNameTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bNameTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 85),
            bNameTitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 15),
            bNameTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -15),
        ])
        
        //Bussiness Name View Title
        bNameSubLabel.text = "bName.subtitle".localized
        bNameSubLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        bNameSubLabel.translatesAutoresizingMaskIntoConstraints = false
        bNameSubLabel.textAlignment = .center
        bNameSubLabel.numberOfLines = 0
        bNameSubLabel.lineBreakMode = .byWordWrapping
        view.addSubview(bNameSubLabel)
        
        //Constraints Welcome Label
        NSLayoutConstraint.activate([
            bNameSubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bNameSubLabel.topAnchor.constraint(equalTo: bNameTitleLabel.bottomAnchor, constant: 30),
            bNameSubLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 15),
            bNameSubLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -15),
        ])
        
        view.addSubview(bNameButton)
        bNameButton.setTitle("bName.button".localized, for: .normal)
        bNameButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        bNameButton.setTitleColor(.white, for: .normal)
        bNameButton.backgroundColor = .init(named: "CL_darkBlue")
        bNameButton.layer.cornerRadius = 12
        bNameButton.translatesAutoresizingMaskIntoConstraints = false

        // Constraints WelcomeButton
        NSLayoutConstraint.activate([
            bNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bNameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            bNameButton.widthAnchor.constraint(equalToConstant: 350),
            bNameButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Configuración básica
        let underline = CALayer()
        underline.backgroundColor = UIColor.darkGray.cgColor
        underline.frame = CGRect(x: 0, y: 49, width: UIScreen.main.bounds.width - 60, height: 1) // 49 porque la altura es 50
        bNameTextField.layer.addSublayer(underline)
        
        bNameTextField.attributedPlaceholder = NSAttributedString(
            string: "bName.TextField.hint".localized,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        bNameTextField.translatesAutoresizingMaskIntoConstraints = false
        bNameTextField.font = .systemFont(ofSize: 28)
        bNameTextField.textAlignment = .center
        bNameTextField.borderStyle = .none

        // Agregar a la vista
        view.addSubview(bNameTextField)

        // Constraints
        NSLayoutConstraint.activate([
            bNameTextField.topAnchor.constraint(equalTo: bNameSubLabel.bottomAnchor, constant: 30),
            bNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])


        //Welcome Button Actions
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(buttonTapped))
        bNameButton.addGestureRecognizer(tapGesture)
        bNameButton.isUserInteractionEnabled = true
        
    }
    
    @objc func buttonTapped() {
        print("Botón bName presionado")
        if let businessName = bNameTextField.text{
            if businessName.isEmpty{
                let emptyTextField = UIAlertController(title: "bName.Alert.title".localized, message: "bName.Alert.message".localized, preferredStyle: .alert)
                let bNameAlertButton = UIAlertAction(title: "bName.Alert.button".localized, style: .default, handler: nil)
                
                emptyTextField.addAction(bNameAlertButton)
                self.present(emptyTextField, animated: true, completion: nil)
            }
        }
        //self.performSegue(withIdentifier: "welcomeSegue", sender: self)
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

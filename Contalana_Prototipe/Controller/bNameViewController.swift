//
//  bNameViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 23/08/25.
//

import UIKit

class bNameViewController: UIViewController, UITextFieldDelegate {
    
    let bNameTitleLabel = UILabel()
    let bNameSubLabel = UILabel()
    let bNameButton = UIButton(type: .system)
    let bNameTextField = UITextField()
    var businessName: String = ""
    //Fechas
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupBNameUI()
        bNameTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //WelcomeLabel
    func setupBNameUI(){
        
        view.backgroundColor = UIColor.backgroundTint
        
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
        bNameButton.layer.cornerRadius = 18
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
    
        let tapGestureView = UITapGestureRecognizer(target: self, action:#selector(hideKeyboard))
        view.addGestureRecognizer(tapGestureView)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @objc func buttonTapped() {
        print("Botón bName presionado")
        
        let bNameRegex = "^[A-Z0-9a-z._$&/\"']{1}[A-Z0-9a-z._$&/\"' ]{3,30}[A-Z0-9a-z._$&/\"']{1}$"
        let bNameTest = NSPredicate(format: "SELF MATCHES %@", bNameRegex)
        
        businessName = bNameTextField.text!
        var errorMessage = ""
        
            
        if businessName.isEmpty{
            
            errorMessage = "bName.Alert.empty".localized
            
        }else if !(bNameTest.evaluate(with: businessName)){
            
            errorMessage = "bName.Alert.notValid".localized
            
        }else if businessName.count > 32 || businessName.count < 5 {
            
            errorMessage = "bName.Alert.notValid".localized
        }
        
        if !errorMessage.isEmpty{
            
                let emptyFieldAlert = UIAlertController(title: "bName.Alert.title".localized, message: errorMessage, preferredStyle: .alert)
                
                let alertButton = UIAlertAction(title: "bName.Alert.button".localized, style: .default, handler: nil)
                emptyFieldAlert.addAction(alertButton)
                
                self.present(emptyFieldAlert, animated: true, completion: nil)
        }else{
            UserDefaults.standard.set(true, forKey: "businessExists")
            UserDefaults.standard.setValue(businessName, forKey: "businessName")
            UserDefaults.standard.set(false, forKey: "productExists")
            
            self.performSegue(withIdentifier: "bNameSegue", sender: self)
            //let nameRegisterDate = Date()
            //UserDefaults.standard.set(dateFormatter.string(from: nameRegisterDate), forKey: "bnameRegisterDate")
            
        }
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let destinationViewController = segue.destination as! formViewController
        destinationViewController.businessNameForm = self.businessName
            
    }*/
    
}

extension bNameViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 1. Oculta el teclado.
        // El método .resignFirstResponder() hace que el campo de texto renuncie
        // a ser el "primer respondedor" (el que recibe la entrada de texto),
        // lo que automáticamente cierra el teclado virtual.
        textField.resignFirstResponder()
        
        // 2. Devuelve 'true' para indicar que has manejado el evento.
        return true
    }
}



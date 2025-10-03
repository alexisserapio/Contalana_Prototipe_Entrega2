//
//  FormViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 30/09/25.
//

import UIKit

class formViewController: UIViewController {
    
    let formLogo = UIImageView()
    let text = UILabel()
    let formButton = UIButton()
    var businessNameForm: String = ""

    override func viewDidLoad() {
    
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        
        view.backgroundColor = UIColor.backgroundTint
        
        view.addSubview(formLogo)
        view.addSubview(text)
        
        UserDefaults.standard.synchronize()
        
        let businessExists = UserDefaults.standard.bool(forKey: "businessExists")
        if businessExists{
            text.text = businessNameForm
        }else{
            text.text = "false"
        }
        
        formLogo.image = UIImage(named: "Logo")
        //formLogo.contentMode = .scaleAspectFit
        formLogo.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            formLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            formLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.025),
            formLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),//.4
            formLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075),//.15
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.topAnchor.constraint(equalTo: formLogo.bottomAnchor, constant: 15)
        ])
        
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

        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(buttonTapped))
        formButton.addGestureRecognizer(tapGesture)
        formButton.isUserInteractionEnabled = true
    }
    
    @objc func buttonTapped(){
        self.performSegue(withIdentifier: "welcomeSegue", sender: self)
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

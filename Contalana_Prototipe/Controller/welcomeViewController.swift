//
//  welcomeViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 22/08/25.
//

import UIKit

class welcomeViewController: UIViewController {
    
    let welcomeLabel = UILabel()
    let welcomeSubtitleLabel = UILabel()
    let welcomeButton = UIButton(type: .system)
    let welcomeImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareWelcomeUI()
        // Do any additional setup after loading the view.
    }
    
    func prepareWelcomeUI(){
        //WelcomeLabel
        view.addSubview(welcomeLabel)
        welcomeLabel.text = "welcome.title".localized
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints Welcome Label
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -225)
        ])
        
        //WelcomeSubtitleLabel
        view.addSubview(welcomeSubtitleLabel)
        welcomeSubtitleLabel.text = "welcome.subtitle".localized
        welcomeSubtitleLabel.textAlignment = .center // Centrar texto dentro del label
        welcomeSubtitleLabel.numberOfLines = 0
        welcomeSubtitleLabel.lineBreakMode = .byWordWrapping
        welcomeSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints Welcome Subtitle Label
        NSLayoutConstraint.activate([
            welcomeSubtitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 40),
            welcomeSubtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -40),
            welcomeSubtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeSubtitleLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ])
        
        //Welcome Button
        view.addSubview(welcomeButton)
        welcomeButton.setTitle("welcome.button".localized, for: .normal)
        welcomeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        welcomeButton.setTitleColor(.white, for: .normal)
        welcomeButton.backgroundColor = .systemBlue
        welcomeButton.layer.cornerRadius = 12
        welcomeButton.translatesAutoresizingMaskIntoConstraints = false

        // Constraints WelcomeButton
        NSLayoutConstraint.activate([
            welcomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            welcomeButton.widthAnchor.constraint(equalToConstant: 350),
            welcomeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Welcome Button Actions
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(buttonTapped))
        welcomeButton.addGestureRecognizer(tapGesture)
        welcomeButton.isUserInteractionEnabled = true

    }
    
    @objc func buttonTapped() {
        print("Botón presionado")
        self.performSegue(withIdentifier: "welcomeSegue", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        let destinationViewController = segue.destination as! informativeViewController
//    }
    
}


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
    let welcome_BlueSquare = UIImageView()
    let welcome_GreenSquare = UIImageView()
    let welcomeTermsConditions = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareWelcomeUI()
        // Do any additional setup after loading the view.
        runWelcomeAnimation(blueSquare: welcome_BlueSquare, greenSquare: welcome_GreenSquare, title: welcomeLabel, subtitle: welcomeSubtitleLabel, button: welcomeButton)
    }
    
    func prepareWelcomeUI(){
        //WelcomeImage
        welcome_BlueSquare.image = UIImage(named: "square_lightblue")
        welcome_BlueSquare.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcome_BlueSquare)
        NSLayoutConstraint.activate([
            welcome_BlueSquare.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 85),
            welcome_BlueSquare.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: 135),
            welcome_BlueSquare.widthAnchor.constraint(equalToConstant: 750),
            welcome_BlueSquare.heightAnchor.constraint(equalToConstant: 750)
        ])
        
        welcome_GreenSquare.image = UIImage(named: "square_lightgreen")
        welcome_GreenSquare.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcome_GreenSquare)
        NSLayoutConstraint.activate([
            welcome_GreenSquare.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            welcome_GreenSquare.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 80),
            welcome_GreenSquare.widthAnchor.constraint(equalToConstant: 750),
            welcome_GreenSquare.heightAnchor.constraint(equalToConstant: 750)
        ])
        
        
        //WelcomeLabel
        view.addSubview(welcomeLabel)
        welcomeLabel.text = "welcome.title".localized
        welcomeLabel.textColor = UIColor.white
        welcomeLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints Welcome Subtitle Label
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 40),
            welcomeLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -40),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -230)
        ])
        
        //WelcomeSubtitleLabel
        view.addSubview(welcomeSubtitleLabel)
        welcomeSubtitleLabel.text = "welcome.subtitle".localized
        welcomeSubtitleLabel.textColor = UIColor.white
        welcomeSubtitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        welcomeSubtitleLabel.textAlignment = .center // Centrar texto dentro del label
        welcomeSubtitleLabel.numberOfLines = 0
        welcomeSubtitleLabel.lineBreakMode = .byWordWrapping
        welcomeSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints Welcome Subtitle Label
        NSLayoutConstraint.activate([
            welcomeSubtitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 40),
            welcomeSubtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -40),
            welcomeSubtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeSubtitleLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -175)
        ])
        
        //Welcome Button
        view.addSubview(welcomeButton)
        welcomeButton.setTitle("welcome.button".localized, for: .normal)
        welcomeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        welcomeButton.setTitleColor(.white, for: .normal)
        welcomeButton.backgroundColor = .init(named: "CL_darkBlue")
        welcomeButton.layer.cornerRadius = 18
        welcomeButton.translatesAutoresizingMaskIntoConstraints = false

        // Constraints WelcomeButton
        NSLayoutConstraint.activate([
            welcomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            welcomeButton.widthAnchor.constraint(equalToConstant: 350),
            welcomeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(welcomeTermsConditions)
        welcomeTermsConditions.text = "welcome.terms".localized
        welcomeTermsConditions.textColor = UIColor.white
        welcomeTermsConditions.font = UIFont.systemFont(ofSize: 14, weight: .light)
        welcomeTermsConditions.textAlignment = .center // Centrar texto dentro del label
        welcomeTermsConditions.numberOfLines = 0
        welcomeTermsConditions.lineBreakMode = .byWordWrapping
        welcomeTermsConditions.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints Welcome Subtitle Label
        NSLayoutConstraint.activate([
            welcomeTermsConditions.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 30),
            welcomeTermsConditions.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -30),
            welcomeTermsConditions.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeTermsConditions.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
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
    
    func runWelcomeAnimation(blueSquare: UIImageView, greenSquare: UIImageView, title: UILabel, subtitle: UILabel, button: UIButton) {
        
        // Estado inicial (invisible)
        title.alpha = 0
        subtitle.alpha = 0
        button.alpha = 0
        
        // Animación del cuadrado azul
        UIView.animate(withDuration: 0.8, animations: {
            blueSquare.transform = CGAffineTransform(rotationAngle: CGFloat(25 * 3.1416 / 180))
        }) { _ in
            // Cuando termine la animación azul → aparece el título
            UIView.animate(withDuration: 0.8, animations: {
                title.alpha = 1
            }) { _ in
                // Luego el subtítulo
                UIView.animate(withDuration: 0.5, animations: {
                    subtitle.alpha = 1
                }) { _ in
                    // Finalmente el botón
                    UIView.animate(withDuration: 0.5) {
                        button.alpha = 1
                    }
                }
            }
        }
            
            // Animación del cuadrado verde en paralelo
            UIView.animate(withDuration: 0.8) {
                greenSquare.transform = CGAffineTransform(rotationAngle: CGFloat(-25 * 3.1416 / 180))
            }
        }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        let destinationViewController = segue.destination as! informativeViewController
//    }
    
}


//
//  welcomeViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 22/08/25.
//

import UIKit

class welcomeViewController: UIViewController, UITextViewDelegate {
    
    let welcomeLabel = UILabel()
    let welcomeSubtitleLabel = UILabel()
    let welcomeButton = UIButton(type: .system)
    let welcome_BlueSquare = UIImageView()
    let welcome_GreenSquare = UIImageView()
    let welcomeTermsConditions = NoSelectableTextView()
    let welcomeSignIn = NoSelectableTextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareWelcomeUI()
        // Do any additional setup after loading the view.
        runWelcomeAnimation(blueSquare: welcome_BlueSquare, greenSquare: welcome_GreenSquare, title: welcomeLabel, subtitle: welcomeSubtitleLabel, button: welcomeButton, terms: welcomeTermsConditions, signIn: welcomeSignIn)
    }
    
    func prepareWelcomeUI(){
        
        //Background Blue Square
        welcome_BlueSquare.image = UIImage(named: "square_lightblue")
        welcome_BlueSquare.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcome_BlueSquare)

        NSLayoutConstraint.activate([
            // TAMAÑO: El ancho y el alto serán el 200% del ancho de la vista contenedora (view).
            welcome_BlueSquare.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2),
            welcome_BlueSquare.heightAnchor.constraint(equalTo: welcome_BlueSquare.widthAnchor), // Siempre será un cuadrado

            // POSICIÓN Y MARGEN:
            // Borde superior 10% del alto total de la vista contenedora
            welcome_BlueSquare.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.10),
            // El borde derecho se fija al borde derecho de la vista, más un margen del 20% del ancho de la vista.
            welcome_BlueSquare.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.bounds.width * 0.5)
        ])
        
        //Background Green Square
        welcome_GreenSquare.image = UIImage(named: "square_lightgreen")
        welcome_GreenSquare.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcome_GreenSquare)
        
        NSLayoutConstraint.activate([
            welcome_GreenSquare.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2),
            welcome_GreenSquare.heightAnchor.constraint(equalTo: welcome_GreenSquare.widthAnchor),
            welcome_GreenSquare.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.25 ),
            welcome_GreenSquare.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.2)
        ])
        
        //WelcomeLabel
        view.addSubview(welcomeLabel)
        welcomeLabel.text = "welcome.title".localized
        welcomeLabel.textColor = UIColor.white
        welcomeLabel.font = UIFont.systemFont(ofSize: 44, weight: .heavy)
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints WelcomeLabel
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.45),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        //WelcomeSubtitleLabel
        view.addSubview(welcomeSubtitleLabel)
        welcomeSubtitleLabel.text = "welcome.subtitle".localized
        welcomeSubtitleLabel.textColor = UIColor.white
        welcomeSubtitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        welcomeSubtitleLabel.textAlignment = .center // Centrar texto dentro del label
        welcomeSubtitleLabel.numberOfLines = 0
        welcomeSubtitleLabel.lineBreakMode = .byWordWrapping
        welcomeSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints Welcome Subtitle Label
        NSLayoutConstraint.activate([
            welcomeSubtitleLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: view.bounds.height * 0.02),
            welcomeSubtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeSubtitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.875)
        ])
        
        //Welcome Button
        view.addSubview(welcomeButton)
        welcomeButton.setTitle("welcome.button".localized, for: .normal)
        welcomeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        welcomeButton.setTitleColor(.white, for: .normal)
        welcomeButton.backgroundColor = .init(named: "CL_darkBlue")
        welcomeButton.layer.cornerRadius = 18
        welcomeButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Welcome Button Actions
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(buttonTapped))
        welcomeButton.addGestureRecognizer(tapGesture)
        welcomeButton.isUserInteractionEnabled = true

        // Constraints WelcomeButton
        NSLayoutConstraint.activate([
            welcomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.bounds.height * 0.115)),
            welcomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            welcomeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Terms and Conditions
        welcomeTermsConditions.isEditable = false
        welcomeTermsConditions.isScrollEnabled = false
        welcomeTermsConditions.delegate = self
        welcomeTermsConditions.backgroundColor = .clear
        welcomeTermsConditions.textContainerInset = .zero
        welcomeTermsConditions.textContainer.lineFragmentPadding = 0
        welcomeTermsConditions.isSelectable = true // necesario para que los links funcionen
        
        let termsText = NSMutableAttributedString(string: "welcome.terms".localized, attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .regular),
            .foregroundColor: UIColor.white
        ])
        
        let tappableTermsText = ("welcome.terms".localized as NSString).range(of: "welcome.terms.label".localized)
        
        let tappablePrivacyText = ("welcome.terms".localized as NSString).range(of: "welcome.terms.policy".localized)
        
        termsText.addAttribute(.foregroundColor, value: UIColor.clDarkBlue, range: tappableTermsText)
        termsText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .regular), range: tappableTermsText)
        termsText.addAttribute(.link, value: "action://navigatorSegue", range: tappableTermsText)
        termsText.addAttribute(.foregroundColor, value: UIColor.lightGray, range: tappablePrivacyText)
        termsText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .regular), range: tappablePrivacyText)
        termsText.addAttribute(.link, value: "action://navigatorSegue", range: tappablePrivacyText)//Modificar el link al agregar la pólitica
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center

        termsText.addAttribute(.paragraphStyle, value: paragraph, range: NSRange(location: 0, length: termsText.length))
        
        welcomeTermsConditions.attributedText = termsText
        
        welcomeTermsConditions.linkTextAttributes = [
            .foregroundColor: UIColor.clDarkBlue,
            .underlineStyle: 0
        ]

        welcomeTermsConditions.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeTermsConditions)
        
        //Constraints Welcome Terms and Conditions
        NSLayoutConstraint.activate([
            welcomeTermsConditions.topAnchor.constraint(equalTo: welcomeButton.bottomAnchor, constant: view.bounds.height * 0.015),
            welcomeTermsConditions.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeTermsConditions.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        //Sign In
        welcomeSignIn.isEditable = false
        welcomeSignIn.isScrollEnabled = false
        welcomeSignIn.delegate = self
        welcomeSignIn.backgroundColor = .clear
        welcomeSignIn.textContainerInset = .zero
        welcomeSignIn.textContainer.lineFragmentPadding = 0
        welcomeSignIn.isSelectable = true // necesario para que los links funcionen
        
        let signInText = NSMutableAttributedString(string: "welcome.signin".localized, attributes: [
            .font: UIFont.systemFont(ofSize: 16, weight: .medium),
            .foregroundColor: UIColor.white
        ])
        
        let tappableSignInText = ("welcome.signin".localized as NSString).range(of: "welcome.signin.label".localized)
        
        signInText.addAttribute(.foregroundColor, value: UIColor.clDarkBlue, range: tappableSignInText)
        signInText.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .bold), range: tappableSignInText)
        signInText.addAttribute(.link, value: "action://navigatorSegue", range: tappableSignInText)
        
        signInText.addAttribute(.paragraphStyle, value: paragraph, range: NSRange(location: 0, length: signInText.length))
        
        welcomeSignIn.attributedText = signInText
        
        welcomeSignIn.linkTextAttributes = [
            .foregroundColor: UIColor.clDarkBlue,
            .underlineStyle: 0
        ]
        
        welcomeSignIn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeSignIn)
        
        //Constraints Signin
        NSLayoutConstraint.activate([
            welcomeSignIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeSignIn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            welcomeSignIn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.bounds.height * 0.04))
        ])

    }
    
    @objc func buttonTapped() {
        print("Botón presionado")
        self.performSegue(withIdentifier: "welcomeSegue", sender: self)
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            if URL.scheme == "action" {
                // Ejecuta el segue con el identifier que hayas definido en el Storyboard
                performSegue(withIdentifier: "navigatorSegue", sender: nil)
                return false // ya manejamos la interacción
            }
            return true
    }
    
    
    func runWelcomeAnimation(blueSquare: UIImageView, greenSquare: UIImageView, title: UILabel, subtitle: UILabel, button: UIButton, terms: NoSelectableTextView, signIn: NoSelectableTextView) {
        
        // Estado inicial (invisible)
        title.alpha = 0
        subtitle.alpha = 0
        button.alpha = 0
        terms.alpha = 0
        signIn.alpha = 0
        
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
                    UIView.animate(withDuration: 0.5, animations: {
                        button.alpha = 1
                        terms.alpha = 1
                    }) { _ in
                        UIView.animate(withDuration: 0.5){
                            signIn.alpha = 1
                        }
                    }
                }
            }
        }
            
            // Animación del cuadrado verde en paralelo
            UIView.animate(withDuration: 0.8) {
                greenSquare.transform = CGAffineTransform(rotationAngle: CGFloat(-25 * 3.1416 / 180))
            }
        }
    
    class NoSelectableTextView: UITextView {
        override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
            return false // oculta menú copiar/pegar
        }

        override var selectedTextRange: UITextRange? {
            get { return nil } // evita selección
            set { }
        }
    }
    
}


//
//  informativeViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 22/08/25.
//

import UIKit

class informativeViewController: UIViewController {
    
    let informativeButton = UIButton()
    
    let informativePageControl = informativePageControlStruct()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInformativeUI()

        // Do any additional setup after loading the view.
    }
    
    func setupInformativeUI(){
        //Informative Button
        view.addSubview(informativeButton)
        informativeButton.setTitle("informative.button".localized, for: .normal)
        informativeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        informativeButton.setTitleColor(.white, for: .normal)
        informativeButton.backgroundColor = .systemBlue
        informativeButton.layer.cornerRadius = 12
        informativeButton.translatesAutoresizingMaskIntoConstraints = false

        // Constraints Informative Button
        NSLayoutConstraint.activate([
            informativeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            informativeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            informativeButton.widthAnchor.constraint(equalToConstant: 350),
            informativeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Informative Button Actions
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(buttonTapped))
        informativeButton.addGestureRecognizer(tapGesture)
        informativeButton.isUserInteractionEnabled = true
        
        //Informative Page Control
        view.addSubview(informativePageControl)
        informativePageControl.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints informative Page Control
        NSLayoutConstraint.activate([
            informativePageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            informativePageControl.bottomAnchor.constraint(equalTo: informativeButton.topAnchor, constant: -20),
            informativePageControl.widthAnchor.constraint(equalToConstant: 250),
            informativePageControl.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    var tappedTimes: Int = 0;
    @objc func buttonTapped() {
        print("Botón presionado")
        if tappedTimes < 2{
            tappedTimes += 1
        }else{
            self.performSegue(withIdentifier: "informativeSegue", sender: self)
        }
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

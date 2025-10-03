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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(formLogo)
        view.addSubview(text)
        
        UserDefaults.standard.synchronize()
        let businessExists = UserDefaults.standard.bool(forKey: "businessExists")
        if businessExists{
            text.text = "true"
        }else{
            text.text = "false"
        }
        
        formLogo.image = UIImage(systemName: "figure.skateboarding")
        formLogo.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            formLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            formLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.topAnchor.constraint(equalTo: formLogo.bottomAnchor, constant: 15)
        ])
        // Do any additional setup after loading the view.
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

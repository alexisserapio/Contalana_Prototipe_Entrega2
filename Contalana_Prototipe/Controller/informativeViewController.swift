//
//  informativeViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 22/08/25.
//

import UIKit

class informativeViewController: UIViewController {
    
    let informativeButton = UIButton()
    let imageView = UIImageView()
    let topLabel = UILabel()      // Label original
    let bottomLabel = UILabel()   // Nuevo label
    let pageControl = UIPageControl()
    
    let informativePosters : [informativePoster] = [
        informativePoster(
            title: "infoPoster.title.one",
            description: "infoPoster.description.one",
            poster: "Mockup"
            ),
        informativePoster(
            title: "infoPoster.title.two",
            description: "infoPoster.description.two",
            poster: "Mockup"
            ),
        informativePoster(
            title: "infoPoster.title.three",
            description: "infoPoster.description.three",
            poster: "Mockup"
            )]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInformativeUI()

        // Do any additional setup after loading the view.
    }
    
    func setupInformativeUI() {
        // Informative Button
        view.addSubview(informativeButton)
        informativeButton.setTitle("informative.button".localized, for: .normal)
        informativeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        informativeButton.setTitleColor(.white, for: .normal)
        informativeButton.backgroundColor = .init(named: "CL_darkBlue")
        informativeButton.layer.cornerRadius = 12
        informativeButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            informativeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            informativeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            informativeButton.widthAnchor.constraint(equalToConstant: 350),
            informativeButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(buttonTapped))
        informativeButton.addGestureRecognizer(tapGesture)
        informativeButton.isUserInteractionEnabled = true

        // Imagen
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: informativePosters[pageControl.currentPage].poster.localized)
        imageView.isUserInteractionEnabled = true

        // Título
        topLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        topLabel.text = informativePosters[pageControl.currentPage].title.localized
        topLabel.textAlignment = .center
        topLabel.numberOfLines = 0
        topLabel.lineBreakMode = .byWordWrapping
        topLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        topLabel.isUserInteractionEnabled = true

        // Descripción
        bottomLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        bottomLabel.textColor = UIColor { trait in
            trait.userInterfaceStyle == .dark ? .lightGray : .darkGray
        }
        bottomLabel.text = informativePosters[pageControl.currentPage].description.localized
        bottomLabel.textAlignment = .center
        bottomLabel.numberOfLines = 0
        bottomLabel.lineBreakMode = .byWordWrapping
        bottomLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        bottomLabel.isUserInteractionEnabled = true

        // PageControl
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
        pageControl.pageIndicatorTintColor = UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .init(named: "backgroundGreen")! : .init(named: "backgroundGreen")!
        }
        pageControl.currentPageIndicatorTintColor = UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .init(named: "darkestGreen")! : .init(named: "darkestGreen")!
        }
        pageControl.backgroundColor = UIColor { trait in
            trait.userInterfaceStyle == .dark ? .init(named: "CL_darkGreen")! :
                .init(named: "CL_darkGreen")!
        }
        pageControl.layer.cornerRadius = 12

        // StackView
        let stackView = UIStackView(arrangedSubviews: [imageView, topLabel, bottomLabel, pageControl])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false

        // Reducir solo el espacio entre topLabel y bottomLabel
        stackView.setCustomSpacing(22, after: bottomLabel)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: informativeButton.topAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // Imagen - restricciones
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])

        // Constraints de Labels
        NSLayoutConstraint.activate([
            bottomLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 40),
            bottomLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -40),
            topLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 10),
            topLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -10)
        ])

        // Gestos
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeft.direction = .left
        stackView.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = .right
        stackView.addGestureRecognizer(swipeRight)
    }

    @objc private func pageChanged() {
        let nextPoster = informativePosters[pageControl.currentPage]
        
       
        UIView.transition(with: imageView,
                        duration: 0.4,
                        options: .transitionFlipFromLeft,
                        animations: {
            self.imageView.image = UIImage(named: nextPoster.poster.localized)
        })
        
        UIView.transition(with: topLabel,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.topLabel.text = nextPoster.title.localized
        })
        
        UIView.transition(with: bottomLabel,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.bottomLabel.text = nextPoster.description.localized
        })
    }


    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            if pageControl.currentPage < informativePosters.count - 1 {
                pageControl.currentPage += 1
                pageChanged() // Actualiza la información en labels e imagen
            }
        } else if gesture.direction == .right {
            if pageControl.currentPage > 0 {
                pageControl.currentPage -= 1
                pageChanged() // Actualiza la información en labels e imagen
            }else if pageControl.currentPage == 0{
                print("Ya no me regreso")
            }
        }
    }
    
    @objc func buttonTapped() {
        print("Botón presionado")
        if pageControl.currentPage < 2{
            pageControl.currentPage += 1
            pageChanged()
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

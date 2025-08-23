//
//  PageControl.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 22/08/25.
//

import UIKit

class informativePageControlStruct: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Configuración de la imagen
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: informativePosters[pageControl.currentPage].poster.localized)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        // Configuración del titulo
        topLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        topLabel.text = informativePosters[pageControl.currentPage].title.localized
        topLabel.textAlignment = .center // Centrar texto dentro del label
        topLabel.numberOfLines = 0
        topLabel.lineBreakMode = .byWordWrapping
        
        // Configuración de la descripcion
        bottomLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        bottomLabel.textColor = .darkGray
        bottomLabel.text = informativePosters[pageControl.currentPage].description.localized
        bottomLabel.textAlignment = .center // Centrar texto dentro del label
        bottomLabel.numberOfLines = 0
        bottomLabel.lineBreakMode = .byWordWrapping
        
        // Configuración del PageControl
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
        
        // StackView vertical
        let stackView = UIStackView(arrangedSubviews: [imageView, topLabel, bottomLabel, pageControl])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    @objc private func pageChanged() {
        topLabel.text = informativePosters[pageControl.currentPage].title.localized
        bottomLabel.text = informativePosters[pageControl.currentPage].description.localized
    }
}


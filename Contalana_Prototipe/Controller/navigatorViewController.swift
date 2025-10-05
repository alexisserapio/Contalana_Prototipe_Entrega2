//
//  termsViewController.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 01/10/25.
//

import UIKit
import WebKit

class navigatorViewController: UIViewController, WKNavigationDelegate {
    
    let retryLabel = UILabel()
    var navigatorImage = UIImageView()
    var actI : UIActivityIndicatorView!
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroundTint
        
        // --- WebView
        webView = WKWebView(frame:view.bounds)
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // --- Controles de reintento
        view.addSubview(navigatorImage)
        view.addSubview(retryLabel)
        navigatorImage.translatesAutoresizingMaskIntoConstraints = false
        retryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        navigatorImage.image = UIImage(systemName: "arrow.counterclockwise.circle.fill")
        navigatorImage.tintColor = UIColor.clLightGreen
        navigatorImage.isHidden = true
        
        retryLabel.text = "Reintentar Conexión"
        retryLabel.isHidden = true
        
        NSLayoutConstraint.activate([
            navigatorImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigatorImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            retryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retryLabel.topAnchor.constraint(equalTo: navigatorImage.bottomAnchor, constant: view.bounds.height * 0.02)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(retryTapped))
        retryLabel.addGestureRecognizer(tapGesture)
        navigatorImage.addGestureRecognizer(tapGesture)
        retryLabel.isUserInteractionEnabled = true
        navigatorImage.isUserInteractionEnabled = true
        
        // --- Activity Indicator
        actI = UIActivityIndicatorView(style: .large)
        actI.center = view.center
        actI.hidesWhenStopped = true
        view.addSubview(actI)
        
        // --- Botón de cerrar
        let botonIzquierdo = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(cerrarVista)
        )
        self.navigationItem.leftBarButtonItem = botonIzquierdo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkConnectionAndProceed()
    }
    
    func checkConnectionAndProceed() {
        actI.startAnimating()
        
        if InternetMonitor.shared.hayConexion {
            //  Mostrar WebView
            webView.isHidden = false
            navigatorImage.isHidden = true
            retryLabel.isHidden = true
            
            if let url = URL(string: "https://github.com/alexisserapio") {
                let request = URLRequest(url:url)
                webView.load(request)
            }
            
        } else {
            //  No hay conexión: oculto el webView y muestro botón de retry
            actI.stopAnimating()
            webView.isHidden = true
            navigatorImage.isHidden = false
            retryLabel.isHidden = false
        }
    }
    
    // --- WKWebView Delegates
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        actI.stopAnimating()
        webView.isHidden = true
        navigatorImage.isHidden = false
        retryLabel.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        actI.stopAnimating()
    }
    
    // --- Botones
    @objc func cerrarVista() {
        self.dismiss(animated: true)
    }
    
    @objc func retryTapped() {
        checkConnectionAndProceed()
    }
}


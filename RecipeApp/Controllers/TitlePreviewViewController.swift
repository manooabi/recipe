//
//  TitlePreviewViewController.swift
//  RecipeApp
//
//  Created by Manoo on 1/5/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {

    
    private let TitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry potter"
        return label
    }()
    
    private let overviewLabel: UILabel = {
       
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Best recipe"
        return label
    }()
    private let overviewLabel1: UILabel = {

           let label = UILabel()
           label.font = .systemFont(ofSize: 18, weight: .regular)
           label.translatesAutoresizingMaskIntoConstraints = false
           label.numberOfLines = 0
           label.text = "Ingredients"
           return label
       }()
    private let savedButton: UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Saved", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    private let webView: WKWebView = {
        
        let webview = WKWebView()
        webview.translatesAutoresizingMaskIntoConstraints = false
        return webview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(TitleLabel)
        view.addSubview(overviewLabel1)
        view.addSubview(overviewLabel)
        
        view.addSubview(savedButton)
        
        configureConstrainst()
    }
    

    func configureConstrainst(){
        let webviewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 250)
          
        ]
        let titleLabelConstraints = [
            TitleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            TitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        let OverviewLabelConstraints = [
                   overviewLabel.topAnchor.constraint(equalTo: overviewLabel1.bottomAnchor, constant: 30),
                   overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                   overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
               ]
        let OverviewLabel1Constraints1 = [
            overviewLabel1.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 30),
            overviewLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        let savedButtonConstraints = [
        
            savedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            savedButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            savedButton.widthAnchor.constraint(equalToConstant: 140),
            savedButton.heightAnchor.constraint(equalToConstant: 40)

        ]
        NSLayoutConstraint.activate(webviewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
         NSLayoutConstraint.activate(OverviewLabel1Constraints1)
         NSLayoutConstraint.activate(OverviewLabelConstraints)
       
        NSLayoutConstraint.activate(savedButtonConstraints)
    }
    
    func configure(with model: TitlePreviewViewModel){
        TitleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else{
            return
        }
        webView.load(URLRequest(url: url))
    }
}

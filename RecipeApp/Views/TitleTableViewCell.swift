//
//  TitleTableViewCell.swift
//  RecipeApp
//
//  Created by Manoo on 1/3/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

   static let identifier = "TitleTableViewCell"
    
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let titlePosterUiImage: UIImageView = {
       
        let imageView =  UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterUiImage)
        contentView.addSubview(titlelabel)
        
        applyconstraints()
    }
    
    private func applyconstraints(){
        let titlePosterUiImageConstraints = [
            titlePosterUiImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterUiImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            titlePosterUiImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlePosterUiImage.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titlelabelConstraints = [
            titlelabel.leadingAnchor.constraint(equalTo: titlePosterUiImage.trailingAnchor, constant: 20),
            titlelabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
        ]
        NSLayoutConstraint.activate(titlePosterUiImageConstraints)
        NSLayoutConstraint.activate(titlelabelConstraints)
    }
    
    
    public func configure(with model: TitleViewModel){
        
        guard let url = URL(string: (model.ImageUrl)) else {return}
        
        titlePosterUiImage.sd_setImage(with: url, completed: nil)
        titlelabel.text = model.titleName
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

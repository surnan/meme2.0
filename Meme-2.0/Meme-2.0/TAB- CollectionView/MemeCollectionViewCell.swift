//
//  MemeCollectionViewCell.swift
//  Meme-2.0
//
//  Created by admin on 12/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class MemeCollectionViewCell: UICollectionViewCell {
    
    var currentMeme: Meme?{
        didSet{
            guard let tempImage = currentMeme?.finalImage else {return}
            cellImageView.image = tempImage
        }
    }
    
    var cellImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(){
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cellImageView)
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
    }
}

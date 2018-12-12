//
//  MemeTableViewCell.swift
//  Meme-2.0
//
//  Created by admin on 12/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell{
    
    var meme: Meme? {
        didSet{
            guard let currentMeme = meme else {return}
            memeImageView.image = currentMeme.finalImage
            memeLabel.attributedText = NSAttributedString(string: "\(currentMeme.top) .... \(currentMeme.bottom)", attributes: memeTextAttributes)
        }
    }
    
    var memeImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let memeTextAttributes:[NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!,
        NSAttributedString.Key.strokeWidth: -4.6
    ]
    
    
    var memeLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        backgroundColor = UIColor.purple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupUI() {
        [memeImageView, memeLabel].forEach{addSubview($0)}
        
        NSLayoutConstraint.activate([
            memeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            memeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            memeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            memeImageView.widthAnchor.constraint(equalTo: memeImageView.heightAnchor),
            
            memeLabel.leadingAnchor.constraint(equalTo: memeImageView.trailingAnchor, constant: 10),
            memeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
}

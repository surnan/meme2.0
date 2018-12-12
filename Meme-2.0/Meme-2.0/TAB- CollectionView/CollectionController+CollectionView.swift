//
//  CollectionController+CollectionView.swift
//  Meme-2.0
//
//  Created by admin on 12/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension CollectionController {

    //MARK:- CollectionView Functions
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newController = MemeCreationController()
        newController.currentMeme = memes[indexPath.item]
        newController.currentIndex = indexPath.item
        present(newController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tempCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as! MemeCollectionViewCell
        tempCell.currentMeme =  memes[indexPath.item]
        return tempCell
    }

}

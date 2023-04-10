//
//  FruitsCollectionViewCell.swift
//  API calling and collectionView
//
//  Created by INCTURE on 10/04/23.
//

import UIKit

class FruitsCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "FruitsCollectionViewCell"
    @IBOutlet weak var playerName: UILabel!

    @IBOutlet weak var outerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.playerName.textColor = .white
        self.outerView.layer.cornerRadius = 10.0
        self.outerView.layer.borderColor = UIColor.black.cgColor
        self.outerView.layer.borderWidth = 0.5
        self.outerView.layer.shadowColor = UIColor.black.cgColor
        self.outerView.backgroundColor = .systemRed
        
    }
}

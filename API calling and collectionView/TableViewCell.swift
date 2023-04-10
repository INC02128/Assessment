//
//  TableViewCell.swift
//  API calling and collectionView
//
//  Created by INCTURE on 10/04/23.
//


import UIKit

class TableViewCell: UITableViewCell {

    static let reuseIdentifier = "TableViewCell"
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.outerView.layer.cornerRadius = 15.0
        self.outerView.layer.shadowColor = UIColor.black.cgColor
        self.outerView.layer.shadowOpacity = 0.5
        self.outerView.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

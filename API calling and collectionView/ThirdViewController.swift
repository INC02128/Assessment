//
//  ThirdViewController.swift
//  API calling and collectionView
//
//  Created by Amit Kumar Sahu on 10/04/23.
//

import UIKit

class ThirdViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

   
    @IBOutlet weak var collectionView: UICollectionView!
    let players = ["Sachin","Dhoni","Virat","Rohit","Rayudu","Raina","UV","ABD","Sehwag","Ganguly","Adam","Pointing"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        register()
        self.navigationController?.title = "My Collection View Cell"
    }
    func register(){
        let nib = UINib(nibName: "FruitsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "FruitsCollectionViewCell")
                
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitsCollectionViewCell", for: indexPath) as! FruitsCollectionViewCell
        cell.playerName.text = players[indexPath.row]
        return cell
    }


}

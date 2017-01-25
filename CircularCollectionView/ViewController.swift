//
//  ViewController.swift
//  CircularCollectionView
//
//  Created by Robert Ryan on 1/24/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var numberOfCells = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.collectionViewLayout = AlternatingGridLayout()
        
        // just for giggles and grins, let's show the insertion of a cell
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.collectionView?.performBatchUpdates({
                self.numberOfCells += 1
                self.collectionView?.insertItems(at: [IndexPath(item: 0, section: 0)])
            }, completion: nil)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.collectionView?.performBatchUpdates({
                self.numberOfCells -= 1
                self.collectionView?.deleteItems(at: [IndexPath(item: 0, section: 0)])
            }, completion: nil)
        }
}
}

// MARK: UICollectionViewDataSource

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CircleCell", for: indexPath)
        return cell
    }
}

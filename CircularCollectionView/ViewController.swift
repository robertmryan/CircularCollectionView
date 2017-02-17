//
//  ViewController.swift
//  CircularCollectionView
//
//  Created by Robert Ryan on 1/24/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var numberOfCells = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.collectionViewLayout = CircleLayout()
        
        // just for giggles and grins, let's show the insertion of a cell
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.collectionView?.performBatchUpdates({
                self.numberOfCells += 1
                self.collectionView?.insertItems(at: [IndexPath(item: 0, section: 0)])
            })
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.collectionView?.performBatchUpdates({
                self.numberOfCells -= 1
                self.collectionView?.deleteItems(at: [IndexPath(item: 0, section: 0)])
            })
        }
    }
    
    // update collection view if size changes (e.g. rotate device)
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition(in: view, animation: { _ in
            self.collectionView?.performBatchUpdates(nil)
        })
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

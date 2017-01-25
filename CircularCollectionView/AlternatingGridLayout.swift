//
//  AlternatingGridLayout.swift
//  CircularCollectionView
//
//  Created by Robert Ryan on 1/25/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

class AlternatingGridLayout: UICollectionViewLayout {
    
    private var center: CGPoint!
    private var itemSize: CGSize!
    private var numberOfItems: Int!
    private var itemsPerRow: Int!
    private var rows: Int!
    private var circleViewCenterOffset: CGPoint!
    private var radius: CGFloat!
    private var insets: UIEdgeInsets!
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        center = CGPoint(x: collectionView.bounds.midX, y: collectionView.bounds.midY)
        radius = CGFloat(40.0)
        itemSize = CGSize(width: radius * 2, height: radius * 2)
        circleViewCenterOffset = CGPoint(x: 2 * radius * cos(.pi / 3),
                                         y: 2 * radius * sin(.pi / 3))
        numberOfItems = collectionView.numberOfItems(inSection: 0)
        itemsPerRow = Int(floor((collectionView.bounds.width - radius) / CGFloat(2 * radius)) + 0.5)
        rows = (numberOfItems - 1) / itemsPerRow + 1
        let excess = collectionView.bounds.width - (CGFloat(itemsPerRow) * radius * 2 + circleViewCenterOffset.x)
        insets = UIEdgeInsets(top: 10, left: excess / 2, bottom: 10, right: excess / 2)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.bounds.width,
                      height: 2 * radius + CGFloat(rows - 1) * circleViewCenterOffset.y + insets.top + insets.bottom)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        attributes.center = centerForItem(at: indexPath)
        attributes.size = itemSize
        
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return (0 ..< collectionView!.numberOfItems(inSection: 0)).map { IndexPath(item: $0, section: 0) }
            .filter { rect.intersects(rectForItem(at: $0)) }
            .flatMap { self.layoutAttributesForItem(at: $0) }
    }
    
    private func centerForItem(at indexPath: IndexPath) -> CGPoint {
        let row = indexPath.item / itemsPerRow
        let col = indexPath.item - row * itemsPerRow
        
        var x: CGFloat = radius + CGFloat(col) * (radius * 2)
        let y: CGFloat = radius + CGFloat(row) * (circleViewCenterOffset.y)
        
        if row % 2 == 0 {
            x += circleViewCenterOffset.x
        }
        
        return CGPoint(x: x + insets.left, y: y + insets.top)
    }
    
    private func rectForItem(at indexPath: IndexPath) -> CGRect {
        let center = centerForItem(at: indexPath)
        
        return CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
    }
    
}

//
//  MTCollectionFlowLayout.swift
//  MTSwift
//
//  Created by MTShawn on 2018/8/10.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit

class MTCollectionFlowLayout: UICollectionViewFlowLayout {
    
    let kScreen_Width = UIScreen.main.bounds.size.width
    let kScreen_Height = UIScreen.main.bounds.size.height
    let ZOOM_FACTOR : CGFloat = 0.1
    let ACTIVE_DISTANCE : CGFloat = 200.0
    
    override init() {
        super.init()
        itemSize = CGSize.init(width: kScreen_Width - 120, height: 200)
        sectionInset = UIEdgeInsets.init(top: 50, left: 40, bottom: 10, right: 40)
        minimumLineSpacing = 15
        scrollDirection = UICollectionViewScrollDirection.horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)
        
        var visibleRect = CGRect.zero
        visibleRect.origin = (collectionView?.contentOffset)!
        visibleRect.size = (collectionView?.frame.size)!
        
        for flowLayout in array! {
            if rect.intersects(flowLayout.frame){
                var distance = visibleRect.midX - flowLayout.center.x
                distance = abs(distance)
                
                if distance < kScreen_Width / 2 + self.itemSize.width{
                    let zoom = 1 + ZOOM_FACTOR * (1 - distance / ACTIVE_DISTANCE)
                    flowLayout.transform3D = CATransform3DMakeScale(zoom, zoom, 1)
                }
                
            }
        }
        
        return array
    }
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let originX = proposedContentOffset.x
        let originY = proposedContentOffset.y
        let width = self.collectionView?.bounds.size.width
        let height = self.collectionView?.bounds.size.height
        let centerX = originX + width! / 2.0
        
        let visibleRect : CGRect = CGRect.init(x: originX, y: originY, width: width!, height: height!)
        let attsArray = self.layoutAttributesForElements(in: visibleRect)
        
        let minAttributs = attsArray?.first
        var minDistance = (minAttributs?.center.x)! - centerX
        
        for currentAtts in attsArray! {
            let distance2 = abs(currentAtts.center.x - centerX)
            if distance2 < minDistance {
                minDistance = distance2
            }
        }
        
        return CGPoint.init(x: originX + minDistance, y: originY)
    }
    
}

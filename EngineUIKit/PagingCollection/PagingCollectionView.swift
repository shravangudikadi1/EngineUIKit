//
//  PagingCollectionView.swift
//  ResuableComponents
//
//  Created by Shravan Gudikadi on 11/29/21.
//

import Foundation
import UIKit

public class PagingCollectionView: UIView {
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    var imgArr = [UIImage?]()
        
    var timer = Timer()
    var counter = 0
    
    
    public func intantiateFromNib() -> PagingCollectionView? {
        var frameworkBundle:Bundle? {
            let bundleId = "com.engineMedia.EngineUIKit"
            return Bundle(identifier: bundleId)
        }
        let paging = frameworkBundle?.loadNibNamed("PagingCollectionView", owner: self, options: nil)
        guard let pagingView = paging?.first as? PagingCollectionView else {
            return nil
        }
        return pagingView
    }
            
     public init() {
        super.init(frame: .zero)
         self.translatesAutoresizingMaskIntoConstraints = false
         backgroundColor = .clear
    }
 
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func registercell() {
        let nib = UINib.init(nibName: "CollectionViewCell", bundle: Bundle(for: CustomCell.self))
        self.sliderCollectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
    }
    
    
    public func configureView(_ images: [UIImage?]) {
        self.imgArr = images
        registercell()
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self

        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        bringSubviewToFront(pageView)
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc func changeImage() {
     
     if counter < imgArr.count {
         let index = IndexPath.init(item: counter, section: 0)
         self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
         pageView.currentPage = counter
         counter += 1
     } else {
         counter = 0
         let index = IndexPath.init(item: counter, section: 0)
         self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
         pageView.currentPage = counter
         counter = 1
     }
         
     }
}

extension PagingCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell else { return UICollectionViewCell() }
        cell.imageView.image = imgArr[indexPath.row]
        return cell
    }

}

extension PagingCollectionView : UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

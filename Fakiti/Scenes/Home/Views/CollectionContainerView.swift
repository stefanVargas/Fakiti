//
//  CollectionContainerView.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 20/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities

class CollectionContainerView: CustomCodeView {
    
    typealias Option = HomeHolderModel.FetchData.ViewModel.DisplayedOption
    
    let kNumberOfSection = 1
    var options = [Option]()
    
    lazy var collectionView: UICollectionView = {
           
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           
           
           let collView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
           collView.backgroundColor = .white
           
           collView.layer.masksToBounds = true
           
           collView.delegate = self
           collView.dataSource = self
           
           return collView
       }()
        
    func startCollection(options: [Option])  {
        self.options = options
        setupViews()
    }
    
    override func setupViews() {
        self.backgroundColor = .clear
        self.collectionView.register(OptionsCollectionCell.self, forCellWithReuseIdentifier: OptionsCollectionCell.identifier)
        addSubview(collectionView)
        
        setupConstraints(pattern: VF.fullVerSmall, views: collectionView)
        setupConstraints(pattern: VF.fullHorTotal, views: collectionView)
        
    }
}


extension CollectionContainerView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return kNumberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return options.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionsCollectionCell.identifier, for: indexPath) as? OptionsCollectionCell {
            
            cell.insideView.layer.masksToBounds = true
            cell.insideView.layer.cornerRadius = 15.0
            cell.insideView.layer.borderWidth = 0.35
            cell.insideView.layer.borderColor = UIColor.gray.cgColor
            
            cell.titleLabel.text = options[indexPath.row].title
            cell.subTitleLabel.text = options[indexPath.row].subTitle
         
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let width: CGFloat = collectionView.frame.width * 0.499
        
        return CGSize(width: width, height: width * (9/11))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.layoutMargins = .zero
        cell.insetsLayoutMarginsFromSafeArea = false
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0.05)
        cell.layer.shadowRadius = 15.0
        cell.layer.shadowOpacity = 0.40
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
}

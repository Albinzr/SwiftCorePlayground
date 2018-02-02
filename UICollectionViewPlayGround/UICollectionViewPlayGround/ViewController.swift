//
//  ViewController.swift
//  UICollectionViewPlayGround
//
//  Created by Albin.git on 2/2/18.
//  Copyright © 2018 Albin.git. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let collectionView:UICollectionView = {
        
        var layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 1,height: 1)
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.scrollsToTop = false
        collectionView.clipsToBounds = true
        collectionView.layer.masksToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        
        initDelegate()
        registerCell()
        
    }
    
    func initDelegate(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func registerCell(){
        
        collectionView.register(CollectionViewCollectionCell.self, forCellWithReuseIdentifier: CollectionViewCollectionCell.description())
        
    }
    
}

extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
           let cell: UICollectionViewCell!
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCollectionCell.description(), for: indexPath)
        return cell
        
        
    }
    
    
}


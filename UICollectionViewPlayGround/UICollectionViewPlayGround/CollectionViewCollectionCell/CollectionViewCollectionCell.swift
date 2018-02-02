//
//  CollectionViewCollectionCell.swift
//  UICollectionViewPlayGround
//
//  Created by Albin.git on 2/2/18.
//  Copyright © 2018 Albin.git. All rights reserved.
//

import UIKit

extension UICollectionViewCell{
    func fixwidth(width:CGFloat){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
}


class CollectionViewCollectionCell:UICollectionViewCell{
    
    
    let scrollCollectionView:UICollectionView = {

        var layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 1,height: 1)
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.scrollsToTop = false
        collectionView.clipsToBounds = true
        collectionView.layer.masksToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView

    }()
//
//
    func initDelegate(){

        scrollCollectionView.delegate = self
        scrollCollectionView.dataSource = self

    }
    
    func registerCell(){

        scrollCollectionView.register(NestedCollectionViewsCell.self, forCellWithReuseIdentifier: NestedCollectionViewsCell.description())

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initDelegate()
        registerCell()
        setupUI()
    }
    
    let coverView:UIView = {
        
        let view = UIView()
        return view
        
    }()
    
    func setupUI(){
        
        let view = self.contentView
        view.addSubview(coverView)
        coverView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 400)
        coverView.addSubview(scrollCollectionView)
        scrollCollectionView.fillSuperview()
        coverView.backgroundColor = .green
        self.fixwidth(width: UIScreen.main.bounds.width)
        
    }
    
}



extension CollectionViewCollectionCell:UICollectionViewDataSource,UICollectionViewDelegate{


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: UICollectionViewCell!

        cell = collectionView.dequeueReusableCell(withReuseIdentifier: NestedCollectionViewsCell.description(), for: indexPath) as! NestedCollectionViewsCell
        return cell

    }


}





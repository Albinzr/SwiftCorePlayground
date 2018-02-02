//
//  NestedCollectionViewsCell.swift
//  UICollectionViewPlayGround
//
//  Created by Albin.git on 2/2/18.
//  Copyright © 2018 Albin.git. All rights reserved.
//

import UIKit

class NestedCollectionViewsCell: UICollectionViewCell{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    let coverView:UIView = {
        
        let view = UIView()
        return view
        
    }()
    
    func setupUI(){
        
        let view = self.contentView
        view.addSubview(coverView)
        coverView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 380)
        coverView.backgroundColor = .blue
        self.fixwidth(width: UIScreen.main.bounds.width)
        
    }
    
}


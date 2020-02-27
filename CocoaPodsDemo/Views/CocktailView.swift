//
//  CocktailView.swift
//  CocoaPodsDemo
//
//  Created by Melinda Diaz on 2/27/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit
import SnapKit

class CocktailView: UIView {
    
    //cocktail name label
    public lazy var cocktailNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            label.numberOfLines = 2
            label.text = "Cocktail Name"
        
        return label
    }()
    
    //cocktailImage
    public lazy var cocktailImage: UIImageView = {
      let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "photo")
        
        return iv
    }()
   
    public lazy var ingredientsLabel: UILabel = {
         let label = UILabel()
          label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
              label.numberOfLines = 4
              label.text = "Ingredients"
          
          return label
      }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupCocktailNameLabelConstraints()
        setupCocktailImageConstraints()
        setUpIngredientsLabelConstraints()
        
    }
    
    private func setupCocktailImageConstraints() {
        addSubview(cocktailImage)
        
        //WE DO NOT NEED TO THIS  cocktailImage.translatesAutoresizingMaskIntoConstraints = false
        
        //INSTEAD WE DO THIS which is chaining together. make is like activate but behind the scene anything extra you want to do should look at the document.
        cocktailImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(self)
        }
    }
    //we cn use the snapkit constraints to out label
    //MARK:12:29
    private func setupCocktailNameLabelConstraints() {
        addSubview(cocktailNameLabel)
       
     cocktailNameLabel.snp.makeConstraints { (make) in
        make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
}
}
private func setUpIngredientsLabelConstraints() {
       addSubview(ingredientsLabel)
      
    ingredientsLabel.snp.makeConstraints { (make) in
        make.leading.bottom.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
    }
}
    //Now we inject this view to the view controller
}

//
//  ViewController.swift
//  CocoaPodsDemo
//
//  Created by Melinda Diaz on 2/27/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit
import Kingfisher

class CocktailViewController: UIViewController {
    
    
    private let cocktailView = CocktailView()
    private lazy var swipeGesture: UISwipeGestureRecognizer = {
        let gesture = UISwipeGestureRecognizer()
        gesture.addTarget(self, action: #selector(fetchCocktail))
        gesture.direction = .left
        return gesture
    }()
    override func loadView() {
        view = cocktailView
    }
    //if you call loadView it will mess up the code when doing this programmatically //MARK: 11:43
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        fetchCocktail()
        //set up swipe gesture on cocktail image
        cocktailView.cocktailImage.isUserInteractionEnabled = true
        cocktailView.cocktailImage.addGestureRecognizer(swipeGesture)
    }
    
    //shake device to change cocktail, this is a UI responder function
    //CTRL CMMD Z will make the simulator shake up
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            fetchCocktail()
        }
    }
    
   @objc private func fetchCocktail() {
        APIClient.fetchCocktail { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("oops no cocktail")
            case .success(let cocktail):
                DispatchQueue.main.async {
                    self?.updateUI(cocktail)
                }
                
            }
        }
    }
    private func updateUI(_ cocktail: Cocktail) {
        guard let imageURL = URL(string: cocktail.strDrinkThumb) else {
            return
        }
        cocktailView.cocktailNameLabel.text = cocktail.strDrink
        cocktailView.ingredientsLabel.text = cocktail.ingredients
        //this is how we use Kingfisher MARK: 11:46 its for updating and dowonloading an image from an URL
        cocktailView.cocktailImage.kf.setImage(with: imageURL)
        //the kingfisher also has an option to make animations
        //Remember you can do other transitions
        UIView.transition(with: cocktailView.cocktailImage, duration: 0.3, options: [.transitionFlipFromRight], animations: {
            self.cocktailView.cocktailImage.kf.setImage(with: imageURL)
        }, completion: nil)
    }
}


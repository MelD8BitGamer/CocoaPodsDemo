//
//  APIClient.swift
//  CocoaPodsDemo
//
//  Created by Melinda Diaz on 2/27/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation
import Alamofire // import NetworkHelper

struct APIClient {
    
    static func fetchCocktail(completion: @escaping (AFResult<Cocktail>) -> ()) {
        //CompilerErrorGeneric type 'Result' specialized with too few type parameters (got 1, but expected 2) so you need to put AF in front of RESULT
        let endpointURLString = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
        
        // we need a URL
        guard let url = URL(string: endpointURLString) else {
            return
        }
        //update wants us to change from Alamofire to AF
        AF.request(url).response { (response) in
            //response.data
            //response.error
            //response.request
            if let error = response.error {
                
            } else if let data = response.data {
                //stir the cocktail
                do{
                    let results = try JSONDecoder().decode(DrinksWrapper.self, from: data)
                    if let cocktail = results.drinks.first {
                        completion(.success(cocktail))
                    }
                    
                } catch {
                    //CompilerErrorMember 'failure' in 'AFResult<Cocktail>' (aka 'Result<Cocktail, AFError>') produces result of type 'Result<Success, Failure>', but context expects 'AFResult<Cocktail>' (aka 'Result<Cocktail, AFError>')
                    print("simple my ")
                    //completion(.failure(error))
                }
            }
        }
    }
    
}

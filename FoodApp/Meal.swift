//
//  Meal.swift
//  FoodApp
//
//  Created by Emmanuel Cuevas on 2/5/16.
//  Copyright © 2016 Emmanuel Cuevas. All rights reserved.
//

import UIKit

class Meal {
    
    //Mark: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //Mark: Initialization
    
    init? (name:String, photo:UIImage?, rating: Int){
        
        //Initialize stored properties
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
        //Initialization should fail if there is no name or if the rating is negative.
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}




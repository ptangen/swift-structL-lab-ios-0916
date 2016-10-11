//
//  Coordinate.swift
//  StructLove
//
//  Created by Michael Dippery on 8/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


//In Coordinate.swift, declare a struct called Coordinate.
//Add two stored properties:
//A Double called latitude
//Another Double called longitude
struct Coordinate {
    var latitude: Double
    var longitude: Double


//Create an initializer with two parameters. Both parameters should be of type Double labeled as latitude and longitude.
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }

//Add four computed properties:
//A Bool called isInNorthernHemisphere. This returns true if the coordinate is in the Northern Hemisphere. (A coordinate is in the Northern Hemisphere if its latitude is positive.)
    var isInNorthernHemisphere: Bool {
        if self.latitude >= 0 { return true }; return false
    }
//A Bool called isInSoutherHemisphere. This returns true if the coordinate is in the Souther Hemisphere. (A coordinate is in the Souther Hemisphere if its latitude is negative.)
    var isInSouthernHemisphere: Bool {
        if self.latitude < 0 { return true }; return false
    }
//A Bool called isInWesternHemisphere. This returns true if the coordinate is in the Western Hemisphere. (A coordinate is in the Western Hemisphere if its longitude is positive.)
    var isInWesternHemisphere: Bool {
        if self.longitude >= 0 { return true }; return false
    }
//A Bool called isInEasternHemisphere. This returns true if the coordinate is in the Eastern Hemisphere. (A coordinate is in the Eastern Hemisphere if its longitude is negative.)
    var isInEasternHemisphere: Bool {
        if self.longitude < 0 { return true }; return false
    }
//Create a method called distance(to:). This method takes one parameter called coordinate of type Coordinate. distance(to:) should return the distance, in kilometers, between the two points. What are the two points? Well.. this function you're implementing is only available to instances of the Coordinate struct. So if an instance of the Coordinate struct calls on this particular method, we will be passing in another Coordinate instance as an argument. So we're left with two Coordinate instances which are available to us within our implementation of this function. The Coordinate which called on the function--we can access the latitude and longitude stored properties by typing latitude or longitude. We can also access these stored properties by typing self.latitude or self.longitude. The parameter of this function is called coordinate. We can access this coordinate's stored properties by typing coordinate.latitude or coordinate.longitude.
    
    func distance(to coordinate: Coordinate) -> Int {
        
        let distancePart1: Double = acos(sin(coordinate.latitude.radians) * sin(self.latitude.radians) + cos(coordinate.latitude.radians) * cos(self.latitude.radians) * cos(coordinate.longitude.radians - self.longitude.radians))
        let distancePart2: Int = Int(distancePart1) * 6371000 / 1000
        
        return Int(distancePart2)
    }
    
//The distance between two coordinates requires some hairy math. The formula is acos(sin(latitude1) * sin(latitude2) + cos(latitude1) * cos(latitude2) * cos(longitude1-longitude2)) * 6371000 / 1000. acos() and sin() are both functions you can call in Swift.
//latitude and longitude need to be converted to radians. A radians property has been created for you to do this, so you can call latitude.radians to get the latitude in radians.


}




// Any double type has now the radians computed property available to it thanks to this extension.

// For Example 
// let number = 5.0
// number.radians

extension Double {
    var radians: Double {
        return self * M_PI / 180
    }
}

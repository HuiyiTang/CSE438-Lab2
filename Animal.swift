//
//  Animal.swift
//  HUIYI TANG-Lab2
//
//  Created by Huiyi Tang on 9/17/21.
//

class Animal {
    
    //Data
    private (set) var happinessRating: Int
    private (set) var foodLevelRating: Int
    private (set) var playCount: Int
    private (set) var fedCount: Int
    private (set) var level: Int
    var name: String?
    
    //Behavior
    func play() {
        foodLevelRating -= 1
        
        if foodLevelRating >= 0 {
            happinessRating += 1
            
            playCount += 1
        }
        
        if foodLevelRating < 0 {
            foodLevelRating = 0
        }
        if happinessRating > 10 {
            happinessRating = 10
        }
    }
    
    func feed() {
        if foodLevelRating < 10 {
            foodLevelRating += 1
            
            fedCount += 1
        }
    }
    
    func levelUp() {
        if playCount >= 10 && playCount >= 10 && Int(playCount/10) == Int(fedCount/10) {
            level = Int(playCount/10)
        }
    }
    
    //Init
    init(name: String) {
        self.name = name
        level = 0
        happinessRating = 0
        foodLevelRating = 0
        playCount = 0
        fedCount = 0
    }
    
}

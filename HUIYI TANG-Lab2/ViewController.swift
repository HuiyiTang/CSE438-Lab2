//
//  ViewController.swift
//  HUIYI TANG-Lab2
//
//  Created by Huiyi Tang on 9/16/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var dogBtnCount = 0, catBtnCount = 0, birdBtnCount = 0, bunnyBtnCount = 0, fishBtnCount = 0
    var player: AVAudioPlayer?

    @IBOutlet weak var happinessRatingView: DisplayView!
    @IBOutlet weak var foodLevelRatingView: DisplayView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var playCount: UILabel!
    @IBOutlet weak var fedCount: UILabel!
    @IBOutlet weak var bgColor: UIView!
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var levelValue: UILabel!
    
    
    var currentAnimal : Animal?
    var dog : Animal?
    var cat : Animal?
    var bird : Animal?
    var bunny : Animal?
    var fish : Animal?
    
    func playSound(sourceName: String) {
        //set up player, and play
        let urlString = Bundle.main.path(forResource: sourceName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
           
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
        
            player.play()
        }
        catch {
            print("something about sound went wrong")
        }
    }

    @IBAction func playAction(_ sender: UIButton) {
        if currentAnimal?.name == dog?.name {
            currentAnimal?.play()
            currentAnimal?.levelUp()
            updateDisplay()
            
            if currentAnimal!.happinessRating > 7 && dog!.foodLevelRating > 0 {
                playSound(sourceName: "dogSound")
            }
            
            dog?.play()
            dog?.levelUp()
        }
        
        if currentAnimal?.name == cat?.name {
            currentAnimal?.play()
            currentAnimal?.levelUp()
            updateDisplay()
            
            if currentAnimal!.happinessRating > 7 && cat!.foodLevelRating > 0 {
                playSound(sourceName: "catSound")
            }
            
            cat?.play()
            cat?.levelUp()
        }
        
        if currentAnimal?.name == bird?.name {
            currentAnimal?.play()
            currentAnimal?.levelUp()
            updateDisplay()
            
            if currentAnimal!.happinessRating > 7 && bird!.foodLevelRating > 0 {
                playSound(sourceName: "birdSound")
            }
            
            bird?.play()
            bird?.levelUp()
        }
        
        if currentAnimal?.name == bunny?.name {
            currentAnimal?.play()
            currentAnimal?.levelUp()
            updateDisplay()
            
            if currentAnimal!.happinessRating > 7 && bunny!.foodLevelRating > 0 {
                playSound(sourceName: "bunnySound")
            }
            
            bunny?.play()
            bunny?.levelUp()
        }
        
        if currentAnimal?.name == fish?.name {
            currentAnimal?.play()
            currentAnimal?.levelUp()
            updateDisplay()
            
            if currentAnimal!.happinessRating > 7 && fish!.foodLevelRating > 0 {
                playSound(sourceName: "fishSound")
            }
            
            fish?.play()
            fish?.levelUp()
        }
    }
    
    @IBAction func feedAction(_ sender: Any) {
        if currentAnimal?.name == dog?.name {
            currentAnimal?.feed()
            currentAnimal?.levelUp()
            dog?.feed()
            dog?.levelUp()
            updateDisplay()
        }
        
        if currentAnimal?.name == cat?.name {
            currentAnimal?.feed()
            currentAnimal?.levelUp()
            cat?.feed()
            cat?.levelUp()
            updateDisplay()
        }
        
        if currentAnimal?.name == bird?.name {
            currentAnimal?.feed()
            currentAnimal?.levelUp()
            bird?.feed()
            bird?.levelUp()
            updateDisplay()
        }
        
        if currentAnimal?.name == bunny?.name {
            currentAnimal?.feed()
            currentAnimal?.levelUp()
            bunny?.feed()
            bunny?.levelUp()
            updateDisplay()
        }
        
        if currentAnimal?.name == fish?.name {
            currentAnimal?.feed()
            currentAnimal?.levelUp()
            fish?.feed()
            fish?.levelUp()
            updateDisplay()
        }
    }
    
    func updateDisplay() {
        playCount.text = "played:" + String((currentAnimal?.playCount)!)
        fedCount.text = "fed:" + String((currentAnimal?.fedCount)!)
        
        levelValue.text = "Level:" + String((currentAnimal?.level)!)
        
        let happinessViewValue = Double((currentAnimal?.happinessRating)!)/10
        let foodViewValue = Double((currentAnimal?.foodLevelRating)!)/10
        
        happinessRatingView.animateValue(to: CGFloat(happinessViewValue))
        foodLevelRatingView.animateValue(to: CGFloat(foodViewValue))
    }
    
    @IBAction func DogView(_ sender: Any) {
        dogBtnCount += 1
        
        bgColor.backgroundColor = UIColor.red
        let dogImage: UIImage = UIImage(named: "dog")!
        animalImage.image = dogImage
        
        happinessRatingView.color = .red
        foodLevelRatingView.color = .red
        
        if dogBtnCount == 1 {
            currentAnimal = Animal(name: "Dog")
            dog = Animal(name: "Dog")
        }
        else if dogBtnCount > 1 {
            currentAnimal = dog
        }

        updateDisplay()
    }
    
    @IBAction func CatView(_ sender: Any) {
        catBtnCount += 1
        
        bgColor.backgroundColor = UIColor.blue
        let catImage: UIImage = UIImage(named: "cat")!
        animalImage.image = catImage
        
        if catBtnCount == 1 {
            currentAnimal = Animal(name: "Cat")
            cat = Animal(name: "Cat")
        }
        else {
            currentAnimal = cat
        }
        
        happinessRatingView.color = .blue
        foodLevelRatingView.color = .blue
        
        updateDisplay()
    }
    
    @IBAction func BirdView(_ sender: Any) {
        birdBtnCount += 1
        
        bgColor.backgroundColor = UIColor.yellow
        let birdImage: UIImage = UIImage(named: "bird")!
        animalImage.image = birdImage
        
        if birdBtnCount == 1 {
            currentAnimal = Animal(name: "Bird")
            bird = Animal(name: "Bird")
        }
        else {
            currentAnimal = bird
        }
        
        happinessRatingView.color = .yellow
        foodLevelRatingView.color = .yellow
        
        updateDisplay()
    }
    
    @IBAction func BunnyView(_ sender: Any) {
        bunnyBtnCount += 1
        
        bgColor.backgroundColor = UIColor.green
        let bunnyImage: UIImage = UIImage(named: "bunny")!
        animalImage.image = bunnyImage
        
        if bunnyBtnCount == 1 {
            currentAnimal = Animal(name: "Bunny")
            bunny = Animal(name: "Bunny")
        }
        else {
            currentAnimal = bunny
        }
        
        happinessRatingView.color = .green
        foodLevelRatingView.color = .green
        
        updateDisplay()
    }
    
    @IBAction func FishView(_ sender: Any) {
        fishBtnCount += 1
        
        bgColor.backgroundColor = UIColor.purple
        let fishImage: UIImage = UIImage(named: "fish")!
        animalImage.image = fishImage
        
        if fishBtnCount == 1 {
            currentAnimal = Animal(name: "Fish")
            fish = Animal(name: "Fish")
        }
        else {
            currentAnimal = fish
        }
        
        happinessRatingView.color = .purple
        foodLevelRatingView.color = .purple
    
        updateDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
        dogBtnCount += 1
        
        bgColor.backgroundColor = UIColor.red
        let dogImage: UIImage = UIImage(named: "dog")!
        animalImage.image = dogImage
        
        //currentAnimal = Animal(name: "Dog")
        
        happinessRatingView.color = .red
        foodLevelRatingView.color = .red
        
        currentAnimal = Animal(name: "Dog")
        dog = Animal(name: "Dog")
        
        updateDisplay()
    }
}


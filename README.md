creative points

1. What I implemented
1.1 5 different animals make different sounds (dog, cat, bird, bunny and fish sound effects are downloaded from the Internet) according to the conditions I set.
1.2 Each animal has its own level (Level value is displayed in the upper right corner of the screen), and it can be upgraded according to the conditions I set.

2. How I implemented it
2.1 Firstly I import AVFoundation. Then I build a playSound() function to realize the goal of making sound. In this function, I get the path of each sound effect mp3 file, set values in setMode and setActive of AVAudioSession.sharedInstance() and use AVAudioPlayer to realize playing function. Meanwhile, use do-catch method to avoid exceptions that crash the program. And finally, call this function when the happiness value is larger than 7. Therefore, the sound of varies animals means that this animal is very happy now.
2.2 I build a levelUp() function in Animal.swift, and make a condition that only if number of times played and number of times fed are in the same number range (Int(number of times played/10) equal to Int(number of times fed/10)), the level value can plus 1. Then call this function every time the user click Play button and Feed button.

3. Why I implemented it
3.1 Adding animal sounds can make the app more interesting and more interactive with users. It can also be used to better convey that this animal is very happy now, rather than just the happiness value in DisplayView.
3.2 Use upgrades to better engage users. In order to get the animal to a higher level, users will be attracted to play this app more.

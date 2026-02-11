//
//  ContentView.swift
//  Random Animal!
//
//  Created by Райымбек Омаров on 10.02.2026.
//

import SwiftUI

struct ContentView: View {
    
    var itemNames :[String] = ["hare","cat","fish","bird","dog","tortoise"]
    var itemIcons : [String] =
    ["hare","cat","fish","bird","dog","tortoise"]
    var itemDescriptions : [String] =
    ["fast creatures i love them omgg, so fast , so cute  ",
    "meow meow nyan eveywhere ! i think cutests creatures in the whole wolrd , aren't they meooow",
     "life is a bubble , under the seaaaa! round enormous eyes look at me , so strange yet cute",
    "their eyes when they seek so food so sincere some birds look graceful like eagles , some are just cute like parratos",
     "dogs can compare with cutuness to cats extreme radiation of cuteness even puppy sounds kawaii",
     "slow but wise , master Oogway vibes but kinds eyes love it"
    
    ]
    
    var itemRatings : [Int] = [3,5,2,4,5,0]
    
 
    
    @State var currentIndex : Int = 0
    @State var tapCount : Int = 0
    @State var isAnimating : Bool = false
    
    var firstTime = 0
    
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(colors: [.teal,.red], startPoint: .top, endPoint: UnitPoint(x: 0.5, y:3.5/CGFloat(itemRatings[currentIndex]+1)))
           
                .ignoresSafeArea(.all)
            
            VStack {
                
                
                Image(systemName: "\(itemIcons[currentIndex])")
                    .font((.system(size: 80)))
                    .scaleEffect(isAnimating ? 2.0 : 1.0)
                
                Text("\(itemNames[currentIndex])")
                    .font(.title)
                    .bold()
                
                Divider()
                
                Text("\(itemDescriptions[currentIndex])")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing],30)
                
                let stringRating =   itemRatings[currentIndex] != 0 ? String(repeating: "🐾", count: itemRatings[currentIndex]) : "Not rated yet"
                
                
                
                Text("Cuteness: \(stringRating)")
                    .foregroundStyle(.secondary)
                    .padding(10)
                
                Button(action: {
                    var newIndex : Int
                    repeat{
                        newIndex  = Int.random(in: 0..<itemNames.count)
                    } while newIndex == currentIndex
                    
                    
                    withAnimation(.spring()) {
                        isAnimating.toggle()
                        
                        
                    } completion: {
                        
                        withAnimation(.spring){
                            isAnimating.toggle()
                        }
                    }
                    
                    
                    
                    
                    currentIndex = newIndex
                    
                    
                    tapCount += 1
                    
                }, label: {
                    Text("Surpise me")
                        .padding(12)
                    //  .background(Color.blue)
                    //   .foregroundStyle(Color.white)
                    //   .clipShape(.capsule)
                    
                    
                })
                .buttonStyle(.borderedProminent)
                
                Text("Cards explored : \(tapCount)")
                    .padding(10)
                
                
            }
            
            
          
            
            
            
            
            
                .padding()
            
        }
    
        
        
        
        
    }
    
//    private var back : some View {
//      
//    }

}


#Preview {
    ContentView()
}

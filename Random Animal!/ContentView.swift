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
    
    var colorsGradient :[Color] =    [.teal,.red]
    
    func endOfGradient(_ index:Int) -> UnitPoint {
        return UnitPoint(x: 0.5, y:3.5/CGFloat(index+1))
    }
    
    @State var currentIndex : Int = 0
    @State var tapCount : Int = 0
    @State var isAnimating : Bool = false
    
    @State var isTransAnimating : Bool = false
    
    var firstTime = 0
    
    var body: some View {
        
        ZStack{
            
        LinearGradient(
             colors:  colorsGradient,
             startPoint: .top,
             endPoint:  endOfGradient(itemRatings[currentIndex])
        )
            
        .ignoresSafeArea(.all)
            
      
            
                VStack {
                    card
                    
                    
                }
                .id(currentIndex)
                .transition(.slide)
                
                
                .padding()
            
            
        }
    
    }
    

}


extension ContentView {
    
    @ViewBuilder
   private var card : some View{
        
        
        imageAnimal
       
        textAnimal
       
        Divider()
       
        descriptionAnimal
        
        rating
       
        button
        
        cardsexplored
        
    }
    
    
}

extension ContentView{
    
    private var imageAnimal : some View{
        Image(systemName: "\(itemIcons[currentIndex])")
            .font((.system(size: 80)))
            .scaleEffect(isAnimating ? 2.0 : 1.0)
    }
    
    private var textAnimal : some View{
        Text("\(itemNames[currentIndex])")
            .font(.title)
            .bold()
    }
    
    private var descriptionAnimal : some View{
        Text("\(itemDescriptions[currentIndex])")
            .font(.body)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding([.leading, .trailing],30)
    }
    
    @ViewBuilder
    private var rating : some View {
        let stringRating =   itemRatings[currentIndex] != 0 ? String(repeating: "🐾", count: itemRatings[currentIndex]) : "Not rated yet"
        
        Text("Cuteness: \(stringRating)")
            .foregroundStyle(.secondary)
            .padding(10)

    }
    
    
    private var button : some View {
        Button(action: {
            var newIndex : Int
            repeat{
                newIndex  = Int.random(in: 0..<itemNames.count)
            } while newIndex == currentIndex
            
           
            withAnimation{
                currentIndex = newIndex
            }
            completion :{
                
                withAnimation(.spring()) {
                        
                  
                    isAnimating.toggle()
                        
                        
                        
                    } completion: {
                       
                        withAnimation(.spring()){
                                              isAnimating.toggle()
                            
                        }
                    }
            }
            
            
            
            
          
            
            
            tapCount += 1
            
        }, label: {
            Text("Surpise me")
                .padding(12)
            
        })
        .buttonStyle(.borderedProminent)
    }
    
    private var cardsexplored : some View{
        
        Text("Cards explored : \(tapCount)")
            .padding(10)
    }
}




#Preview {
    ContentView()
}

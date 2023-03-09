//
//  ContentView.swift
//  BMISwiftUI
//
//  Created by Pablo  on 9/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var weigth:String = ""
    @State private var height:String = ""
    @State private var bmi:Double = 0.0
    @State private var clasifier:String = ""

    var body: some View {
        VStack{
            Text("IBM calculator").font(.title2)
            TextField("Enter weight (in kilograms)", text: $weigth)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.black)
            
            TextField("Enter height (in meters)", text: $height)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.black)
            
            Button(action:{
                let weight = Double(self.weigth)!
                let height = Double(self.height)!
                self.bmi = weight/(height * height)
                
                if self.bmi < 18.5 {
                    clasifier = "Underweight"
                } else if self.bmi < 24.9 {
                    clasifier = "Healty weight"
                } else if self.bmi < 29.9 {
                    clasifier = "OverWeight"
                } else {
                    clasifier = "Obese"
                }
                
            }){
                Text("Calculate BMI")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
            }
            Text("BMI: \(bmi,specifier: "%.1f"),\(clasifier)").font(.title).padding()
                

        }.padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

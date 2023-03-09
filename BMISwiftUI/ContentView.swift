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
        ZStack {
            Color.accentColor.opacity(0.5)
            
            VStack{
                Text("BMI calculator").font(.title).foregroundColor(.black).padding(5)

                 TextField("Enter weight (in kilograms)", text: $weigth)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .border(.black)
                     .padding(10)
                 
                 TextField("Enter height (in meters)", text: $height)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .border(.black)
                     .padding(10)
                 
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
                 }.padding(.bottom,20)
                Text("BMI: \(bmi,specifier: "%.1f")").font(.title).padding(.bottom,10)
                Text("Result: \(clasifier)").fontDesign(.rounded).fontWeight(.bold).padding(.bottom,10)
                 
                 
             }.background(.gray)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 5)
                )
                .padding(50)
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView().environment(\.colorScheme,.light)
        }
    }
}

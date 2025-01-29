//
//  nutrientsCard.swift
//  PhotoDisplay
//
//  Created by Sai bharadwaj Adapa on 1/28/25.
//

import SwiftUI

struct nutrientsCard: View {
    
    @State var nutrientname : String
    @State var value : Double?
    var body: some View {
        
        if(nutrientname == "Sodium" || nutrientname ==  "Cholestrol" || nutrientname == "Potassium" ){
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height:50)
                        .foregroundStyle(Color.white)
                        .shadow(radius: 5)
                    HStack{
                        Text(nutrientname)
                            .font(.title2)
                            .bold()
                        Spacer()
                        Text("\(String(format: "%.2f", value ?? 0.0))mg")
                            .bold()
                    }
                    .padding()
                    
                }.padding(.horizontal)
        }
        }
        else{
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height:50)
                        .foregroundStyle(Color.white)
                        .shadow(radius: 5)
                    HStack{
                        Text(nutrientname)
                            .font(.title2)
                            .bold()
                        Spacer()
                        Text("\(String(format: "%.2f", value ?? 0.0))g")
                            .bold()
                    }
                    .padding()
                    
                }.padding(.horizontal)
        }
        }
           
        }
    }


#Preview {
    nutrientsCard( nutrientname: "Calories", value: 0.0)
}

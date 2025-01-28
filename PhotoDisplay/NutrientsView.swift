//
//  NutrientsView.swift
//  PhotoDisplay
//
//  Created by Sai bharadwaj Adapa on 1/26/25.
//

import SwiftUI

struct NutrientsView: View {
    
    @Binding var nutrients : DataModel
    @State var image : UIImage?
    
    
    var body: some View {
        
        VStack{
            if let imageData = image{
                Image(uiImage: imageData).resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 300)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.6)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 300)
            }
          
            Text(nutrients.items.first?.name ?? "no name")
                .font(.largeTitle)
                .bold()
            
            VStack{
                ScrollView{
                    
                    
                    nutrientsCard(nutrientname: "Calories", value: nutrients.items.first?.calories)
                    
                    
                    nutrientsCard(nutrientname: "Fat", value: nutrients.items.first?.fat_total_g)
                    
                    nutrientsCard(nutrientname: "Protein", value: nutrients.items.first?.protein_g)
                    
                    nutrientsCard(nutrientname: "Potassium", value: nutrients.items.first?.potassium_mg)
                    
                    nutrientsCard(nutrientname: "Sodium", value: nutrients.items.first?.sodium_mg)
                    
                    nutrientsCard(nutrientname: "Cholestrol", value: nutrients.items.first?.cholestrol_mg)
                    
                    nutrientsCard(nutrientname: "Carbohydrates", value: nutrients.items.first?.carbohydrates_total_g)
                  
                    nutrientsCard(nutrientname: "Fibre", value: nutrients.items.first?.fiber_g)
                    
                    nutrientsCard(nutrientname: "Sugar", value: nutrients.items.first?.sugar_g)

                }
               
            }
            
           
        }
        
     
        

        Spacer()
    }
}

#Preview {
    NutrientsView(nutrients: .constant(DataModel(items: [item(name: "Apple", calories: 52.0)])))
}

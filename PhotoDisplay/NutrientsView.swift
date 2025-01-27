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
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:50)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        HStack{
                            Text("Calories")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("\(String(format: "%.2f", nutrients.items.first?.calories ?? 0.0))g")
                                .bold()
                        }
                        .padding()
                        
                    }.padding(.horizontal)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:50)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        HStack{
                            Text("Fat")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("\(String(format: "%.2f", nutrients.items.first?.fat_total_g ?? 0.0))g")
                                .bold()
                        }
                        .padding()
                        
                    }.padding(.horizontal)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:50)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        HStack{
                            Text("Protein")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("\(String(format: "%.2f", nutrients.items.first?.protein_g ?? 0.0))g")
                                .bold()
                        }
                        .padding()
                        
                    }.padding(.horizontal)
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:50)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        HStack{
                            Text("Potassium")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("\(String(format: "%.2f", nutrients.items.first?.potassium_mg ?? 0.0))mg")
                                .bold()
                        }
                        .padding()
                        
                    }.padding(.horizontal)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:50)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        HStack{
                            Text("Sodium")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("\(String(format: "%.2f", nutrients.items.first?.sodium_mg ?? 0.0))mg")
                                .bold()
                        }
                        .padding()
                        
                    }.padding(.horizontal)
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:50)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        HStack{
                            Text("Carbohydrates")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("\(String(format: "%.2f", nutrients.items.first?.carbohydrates_total_g ?? 0.0))g")
                                .bold()
                        }
                        .padding()
                        
                    }.padding(.horizontal)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:50)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        HStack{
                            Text("Fibre")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("\(String(format: "%.2f", nutrients.items.first?.fiber_g ?? 0.0))g")
                                .bold()
                        }
                        .padding()
                        
                    }.padding(.horizontal)
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:50)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 5)
                        HStack{
                            Text("Sugar")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("\(String(format: "%.2f", nutrients.items.first?.sugar_g ?? 0.0))g")
                                .bold()
                        }
                        .padding()
                        
                    }.padding(.horizontal)

                }
               
            }
            
           
        }
        
     
        

        Spacer()
    }
}

#Preview {
    NutrientsView(nutrients: .constant(DataModel(items: [item(name: "Apple", calories: 52.0)])))
}

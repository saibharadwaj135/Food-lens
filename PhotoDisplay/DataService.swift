//
//  DataService.swift
//  PhotoDisplay
//
//  Created by Sai bharadwaj Adapa on 1/26/25.
//

import Foundation

struct DataService{
    
    func getData(query: String) async -> DataModel {
        
        guard let url = URL(string: "https://api.calorieninjas.com/v1/nutrition?query=\(query)") else { fatalError("url not found") }
        
        var request = URLRequest(url: url)
        
        request.setValue("ettM5Ap7p0uovBzctDVI4w==Uv2lebTdsXQ7ernS", forHTTPHeaderField: "X-Api-Key")
        
        do{
          let (data,response) = try await URLSession.shared.data(for: request)
//            
//            print(data)
//            print(response)
            
            let decoder = JSONDecoder()
            
            do{
                let result = try decoder.decode(DataModel.self, from: data)
                
                //print(result)
                
                return result
            }
            catch{
                print(error)
            }
             
        
        }
        catch{
            print(error)
        }
       
        
        
        return DataModel(items: [item]())
    }
    
}

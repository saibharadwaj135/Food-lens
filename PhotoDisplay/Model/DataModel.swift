//
//  DataModel.swift
//  PhotoDisplay
//
//  Created by Sai bharadwaj Adapa on 1/26/25.
//

import Foundation

struct DataModel : Codable
{
    var items : [item]
}

struct item : Codable
{
    var name : String?
    var calories : Double?
    var serving_size_g : Double?
    var fat_total_g : Double?
    var protein_g : Double?
    var cholestrol_mg : Double?
    var sodium_mg : Double?
    var potassium_mg : Double?
    var carbohydrates_total_g : Double?
    var fiber_g : Double?
    var sugar_g : Double?
}

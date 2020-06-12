//
//  Model.swift
//  HotelTableViewWithAlamofire
//
//  Created by Sathsara Maduranga on 6/10/20.
//  Copyright © 2020 Sathsara Maduranga. All rights reserved.
//

import Foundation

struct hotelData:Codable
{
    var data: [hotel]?
}

struct hotel : Codable{
    var title : String?
    var address : String?
    var image : image
    var longitude : String?
    var latitude : String?
}

struct image : Codable
{
    var small : String?
    var medium : String?
    var large : String?
}

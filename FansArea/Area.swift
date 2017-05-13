//
//  Area.swift
//  FansArea
//
//  Created by Weilong Zhao on 29/4/17.
//  Copyright © 2017 Weilong Zhao. All rights reserved.
//

struct Area {
    var name : String
    var province : String
    var part : String
    var image : String
    var isVisited : Bool
    var rating = ""
    
    init (name: String, province: String, part: String, image: String, isVisited: Bool){
        self.name = name
        self.province = province
        self.part = part
        self.image = image
        self.isVisited = isVisited
    }
}

//
//  CatsModel.swift
//  XMLParseDemo
//
//  Created by liuxiang on 2018/1/12.
//  Copyright © 2018年 liuxiang. All rights reserved.
//

import Foundation

struct CatsModel: Decodable {
    
    var cats: [CatModel]?
    
    init?(xml: String) {
     
//        cats = parseModel(node: "cat", xml: xml)
        
        cats = "cat" <~~ xml
        
    }
    
    
    
}


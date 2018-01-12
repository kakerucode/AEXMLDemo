//
//  CatModel.swift
//  XMLParseDemo
//
//  Created by liuxiang on 2018/1/9.
//  Copyright © 2018年 liuxiang. All rights reserved.
//

import Foundation
import AEXML

struct CatModel: Decodable {
    
    var name: String?
    var breed: String?
    var color: String?
    
    init(xml: String) {
        
//        name = parseModel(node: "cat", xml: xml)
        
        name = "cat" <~~ xml
        
        breed = parseAttribute(node: "cat", attributeName: "breed", xml: xml)
        color = parseAttribute(node: "cat", attributeName: "color", xml: xml)
        
    }
    
}

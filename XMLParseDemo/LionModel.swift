//
//  LionModel.swift
//  XMLParseDemo
//
//  Created by liuxiang on 2018/1/12.
//  Copyright © 2018年 liuxiang. All rights reserved.
//

import Foundation

struct LionModel: Decodable {
    
    var value: String?
    
    init?(xml: String) {
        
//        value = parseModel(node: "lion", xml: xml)
        value = "lion" <~~ xml
    }
    
    
    
    
}

//
//  BatModel.swift
//  XMLParseDemo
//
//  Created by liuxiang on 2018/1/12.
//  Copyright © 2018年 liuxiang. All rights reserved.
//

import Foundation

class BatModel: Decodable {
    
    var value: String?
    
    required init?(xml: String) {
        
        value = parseModel(node: "bat", xml: xml)
        
        
        
    }
}

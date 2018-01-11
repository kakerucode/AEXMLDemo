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
    
    
    var kittys:?
    
    init(xmlString: String) {
        
        do {
            let xmlDoc = try AEXMLDocument(xml: xmlString)
            name = xmlDoc.root.value
            breed = xmlDoc.root.attributes["breed"]
            color = xmlDoc.root.attributes["color"]
        } catch {
            print("error = \(error)")
        }
    }
    
}

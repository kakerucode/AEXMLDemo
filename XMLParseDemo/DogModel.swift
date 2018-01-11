//
//  DogModel.swift
//  XMLParseDemo
//
//  Created by liuxiang on 2018/1/9.
//  Copyright © 2018年 liuxiang. All rights reserved.
//

import Foundation
import AEXML

struct DogModel {
    
    var name: String?
    var breed: String?
    var color: String?
    
    init(xmlString: String) {
     
        do {
            let xmlDoc = try AEXMLDocument(xml: xmlString)
            self.name = xmlDoc.root.value
            self.breed = xmlDoc.root.attributes["breed"]
            self.color = xmlDoc.root.attributes["color"]
        } catch {
            print("error = \(error)")
        }
    }
    
    
}

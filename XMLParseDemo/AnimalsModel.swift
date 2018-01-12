//
//  AnimalsModel.swift
//  XMLParseDemo
//
//  Created by liuxiang on 2018/1/9.
//  Copyright © 2018年 liuxiang. All rights reserved.
//

import Foundation
import AEXML
import Kanna

struct AnimalsModel: Decodable {
    
    var cats: CatsModel?
    var dogs: [DogModel]?
    var lion: LionModel?
    var bats: [BatModel]?
    
    var value: String?

    init(xml: String) {
        
        
        cats = "cats" <~~ xml
        lion = "lion" <~~ xml
        bats = "bats" <~~ xml
        
        
//        cats = parseModel(node: "cats", xml: xml)
//        lion = parseModel(node: "lion", xml: xml)
//        bats = parseModel(node: "bat", xml: xml)
        
        print("lion = \(lion)")
        print("cats = \(cats?.cats)")
        
        
        
//        dogs = parseModel(node: "dogs", xmlString: xml)
        
//        do {
//            let xmlDoc = try AEXMLDocument(xml: xmlString)
//            print("\(xmlDoc.xml)")
//
//            if let catsEle = xmlDoc.root["cats"]["cat"].all {
//                for cat in catsEle {
//                    let cat = CatModel(xmlString: cat.xml)
//                    self.cats?.append(cat)
//                }
//            }
//
//            if let dogsEle = xmlDoc.root["dogs"]["dog"].all {
//                for dog in dogsEle {
//                    let dog = DogModel(xmlString: dog.xml)
//                    self.dogs?.append(dog)
//                }
//            }
//        } catch {
//            print("error \(error)")
//        }
    }
    
}

public protocol Decodable {
    
    init?(xml: String)
    
}


func parseModel<T: Decodable>(node: String, xml: String) -> [T]? {
    
    do {
        var models: [T] = []
        let xmlDoc = try Kanna.XML(xml: xml, encoding: .utf8)
        for element in xmlDoc.xpath("//" + node) {
            
            if let elementXML = element.toXML, let model = T(xml: elementXML)  {
                models.append(model)
            }
        }
        return models
        
    } catch {
        print("\(error)")
    }
    return nil
}


func parseModel<T: Decodable>(node: String, xml: String) -> T? {
    
    do {
        let xmlDoc = try Kanna.XML(xml: xml, encoding: .utf8)
        if let element = xmlDoc.at_xpath("//" + node), let elementXML = element.toXML {
            let model = T(xml: elementXML)
            return model
        }

    } catch {
        print("\(error)")
    }
    
    return nil
}

func parseModel(node: String, xml: String) -> String? {
    
    do {
        let xmlDoc = try Kanna.XML(xml: xml, encoding: .utf8)
        if let element = xmlDoc.at_xpath("//" + node) {
            return element.content
        }
    } catch {
        print("\(error)")
    }
    return nil
}

func parseAttribute(node: String, attributeName: String, xml: String) -> String? {
    
    do {
        let xmlDoc = try Kanna.XML(xml: xml, encoding: .utf8)
        if let element = xmlDoc.at_xpath("//" + node) {
            return element[attributeName]
        }
    } catch {
        print("\(error)")
    }
    
    return nil
}


//precedencegroup DecodingPrecedence {
//    associativity: left
//    higherThan: CastingPrecedence
//}


// MARK: 运算符重载

infix operator <~~

public func <~~ <T: Decodable>(node: String, xml: String) -> T? {
    
    return parseModel(node: node, xml: xml)
}

public func <~~ <T: Decodable>(node: String, xml: String) -> [T]? {
    
    return parseModel(node: node, xml: xml)
}


public func <~~ (node: String, xml: String) -> String? {
    
    return parseModel(node: node, xml: xml)
}





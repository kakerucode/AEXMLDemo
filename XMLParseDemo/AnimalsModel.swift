//
//  AnimalsModel.swift
//  XMLParseDemo
//
//  Created by liuxiang on 2018/1/9.
//  Copyright © 2018年 liuxiang. All rights reserved.
//

import Foundation
import AEXML





struct AnimalsModel {
    
    var cats: [CatModel]?
    var dogs: [DogModel]?
    

    init(xmlString: String) {
    
        cats = [CatModel]()
        dogs = [DogModel]()
        
        cats = parseModel(node: "cats", xmlString: xmlString)
        
        
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
    

    func parseModel<T: Decodable>(node: String, xmlString: String) -> [T]? {
        
        var models: [T] = []
        do {
            let xmlDoc = try AEXMLDocument(xml: xmlString)
            let elements = xmlDoc[node].children
            for element in elements {
                if let model = T(xml: element.xml) {
                    models.append(model)
                }
            }
            
            return models
            
        } catch {
            print("\(error)")
        }
        return nil
    }
    
    func parseModel<T: Decodable>(node: String, xmlString: String) -> T? {
        
        do {
            let xmlDoc = try AEXMLDocument(xml: xmlString)
            if let element = xmlDoc[node].first {
                
                let model = T(xml: element.xml)
                return model
            }
            
        } catch {
            print("\(error)")
        }
        
        return nil
    }
    
    
    func parseModel(attribute: [String], node: String, xmlString: String) -> String? {
        
        do {
            let xmlDoc = try AEXMLDocument(xml: xmlString)
            let element = xmlDoc[node].first
            return element?.value
            
            
        } catch {
            print("\(error)")
        }
        
        return nil
    }
    
    
    func createModel<T: Decodable>(xmlString: String) -> T? {
        
        do {
            let xmlDoc = try AEXMLDocument(xml: xmlString)
            
            
            
        } catch {
            print("\(error)")
        }
        return nil
    }
    
    
    
}

protocol Decodable {
    
    init?(xml: String)
    
}








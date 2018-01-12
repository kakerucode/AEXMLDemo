//
//  ViewController.swift
//  XMLParseDemo
//
//  Created by liuxiang on 2018/1/9.
//  Copyright © 2018年 liuxiang. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animals = AnimalsModel(xml: xmlString)
        
        
        
        
        
//        do {
//            let xml = try Kanna.XML(xml: xmlString, encoding: .utf8)
//            let catsElements = xml.at_xpath("//cats")
//            let catsNode = xml.xpath("//cats")
//
//            for cat in xml.xpath("//cat") {
//
//                print("\(cat.toHTML)")
//            }
//
//
//            let catsXML = catsElements?.innerHTML
//
//            let catsDoc = try Kanna.XML(xml: catsXML!, encoding: .utf8)
//
//            let catNode = catsDoc.xpath("//cat")
//
//
//
//            let cats = xml.xpath("//cats")
//            catsElements?.content
//
//
//
//        } catch {
//            print("\(error)")
//        }
    }
}





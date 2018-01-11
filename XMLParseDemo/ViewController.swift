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
        let animals = AnimalsModel(xmlString: xmlString)
        
        do {
            let xml = try Kanna.XML(xml: xmlString, encoding: .utf8)
            let animalsElement = xml.at_xpath("//cat")
            
            let cats = xml.xpath("//cats")
            
        
            animalsElement?.content
            
            
            
        } catch {
            print("\(error)")
        }
        
    }

}


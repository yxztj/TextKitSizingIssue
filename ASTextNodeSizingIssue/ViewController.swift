//
//  ViewController.swift
//  ASTextNodeSizingIssue
//
//  Created by Jason Yu on 1/13/17.
//  Copyright © 2017 hang. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let english = "test"
        let chinese = "测试"
        let korean = "조선말"
        
        let testString = korean
        
        let label = UILabel()
        label.attributedText = testStringWith(string: testString, color: UIColor.blue)
        label.frame = CGRect(x: 20, y: 20, width: UIScreen.main.bounds.width - 40, height: 800)
        label.sizeToFit()
        self.view.addSubview(label)
        print("label size is \(label.frame.size)")
        
        let node = ASTextNode()
        node.attributedText = testStringWith(string: testString, color: UIColor.black)
        let size = node.calculateSizeThatFits(CGSize(width: UIScreen.main.bounds.width - 40, height: 800))
        node.frame = CGRect(x: 20, y: 20, width: size.width, height: size.height)
        self.view.addSubnode(node)
        print("node size is \(node.frame.size)")
    }
    
    func testStringWith(string: String, color: UIColor) -> NSAttributedString {
        let font = UIFont.systemFont(ofSize: 30)
        let attr: [String: AnyObject] = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: color
        ]
        return NSAttributedString(string: string, attributes: attr)
    }
}


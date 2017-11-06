//
//  ViewController.swift
//  Swift_4_Study
//
//  Created by cooperLink on 2017/10/20.
//  Copyright © 2017年 cooperLink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        #if DEBUG
            print("Debug")
        #endif
        
        // StringForSwiftFour.test()
        
        // DeferAndQueue.test()
        
        // MatetypeOfType.test()
        
        testKeyPath()
    }
    
    
    private func testKeyPath() {
        let aInstace = DeferAndQueue()
        
        print(aInstace.testKeyPath)
        
        let keyPath = \DeferAndQueue.testKeyPath
        aInstace[keyPath: keyPath] = "new keyPath"
        print(aInstace[keyPath: keyPath])
        
        
        let keyPath1 = #keyPath(DeferAndQueue.testKeyPath)
        aInstace.setValue("set #keyPath", forKey: keyPath1)
        print(aInstace.value(forKey: keyPath1) ?? "empty ")
    }
   
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


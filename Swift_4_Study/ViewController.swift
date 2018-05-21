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
        
//        #if DEBUG
//            print("Debug")
//        #else
//            print("Release")
//        #endif
        
        /*
        let str = "SS"
        guard str == "s" else {
            print("guard")
            return
        }
        */
        print("------")
        
        
        // StringForSwiftFour.test()
        
        // DeferAndQueue.test()
        
        // MatetypeOfType.test()
        
        // testKeyPath()
        
        // ArrayStudy.testFlatMap()
        // ArrayStudy.testReduce();
        ArrayStudy.testVaule();
        // let arrS = ArrayStudy()
        
        
    }
    
    
    @IBAction func actionEvent(_ sender: UIButton) {
        print("Button Tag = \(sender.tag)")
        testAlert(sender)
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
   
    
    private func testAlert(_ sourceView: UIView) {
//        VSAlertViewController.presentAlert("Title", message: "Content Of Message", buttonTitles: nil) {
//            (alertController, buttonTitle, buttonIndex) in
//            print("Click title = \(buttonTitle), index = \(buttonIndex)")
//        }
        
//        VSAlertViewController.presentAlert(self, title: "Title", message: "Content Of Message", buttonTitles: ["s"]) { (alertController, buttonTitle, buttonIndex) in
//            print("Click title = \(buttonTitle), index = \(buttonIndex)")
//        }
        
        VSAlertViewController.presentActionSheet(sourceView, title: "Title", message: "Content Of Message", buttonTitles: ["1", "2"]) { (alertController, buttonTitle, buttonIndex) in
            print("Click title = \(buttonTitle), index = \(buttonIndex)")
        }
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


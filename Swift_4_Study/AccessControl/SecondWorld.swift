//
//  SecondWorld.swift
//  Swift_4_Study
//
//  Created by cooperLink on 2017/10/20.
//  Copyright © 2017年 cooperLink. All rights reserved.
//

import UIKit

class SecondWorld: SuperClass {
    
    private func privateFunc() {
        print(self.publicVar)
        print(self.internalVar)
        // print(self.fileprivateVar) // fileprivate can not be inherited
        // print(self.privateVar)     // private can not be inherited
    }
}


class fourthWorld {
    
    private func privateFunc() {
        let thirdWorld = ThirdWorld()
        
        thirdWorld.publicVar = "public"
        print(thirdWorld.publicVar)
        
        thirdWorld.internalVar = "internal"
        print(thirdWorld.internalVar)
        
        // thirdWorld.fileprivateVar = "fileprivate"
        // print(thirdWorld.fileprivateVar)             // fileprivate can not access

        // thirdWorld.private = "fileprivate"
        // print(thirdWorld.private)                    // private can not access
    }
}

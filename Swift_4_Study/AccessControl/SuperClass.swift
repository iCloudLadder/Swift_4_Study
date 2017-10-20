//
//  SuperClass.swift
//  Swift_4_Study
//
//  Created by cooperLink on 2017/10/20.
//  Copyright © 2017年 cooperLink. All rights reserved.
//

import Foundation

class SuperClass {
    
    public var publicVar = ""
    internal var internalVar = "" // defualt is internal
    fileprivate var fileprivateVar = ""
    private var privateVar = ""
    
    static var staticVar = ""       // can not be overrided
    static var staticGetSet: String {
        set {
            self.staticGetSet = newValue
        }
        get {
            return self.staticVar
        }
    }
    class var classVar: String { // only computed type property can use 'class', but can be overrided
        return ""
    }
    
    class var classVarGetSet: String { // only computed type property can use 'class', but can be overrided
        set {
            self.classVarGetSet = newValue
        }
        
        get {
            return self.classVarGetSet
        }
    }
    
    static func staticFunc() { // can not be overrided
        
    }
    
    class func classFunc() { // can be overrided
        
    }
    
    
    
}



class FirstWorld {
    public let superCalss = SuperClass()
    
    fileprivate func fileprivateFunc() {
        
        superCalss.publicVar = "public"
        print(superCalss.publicVar)
        
        superCalss.internalVar = "internal"
        print(superCalss.internalVar)
        
        superCalss.fileprivateVar = "fileprivate"
        print(superCalss.fileprivateVar)
        
        // superCalss.privateVar = "private"
        // print(superCalss.privateVar) // private can not access
    }
}


class ThirdWorld: SuperClass {
    
    override class var classVar: String {
        set {
            self.classVar = newValue
        }
        
        get {
            return self.classVar
        }
    }
    
//    override class var classVarGetSet: String {
//        return ""
//    }
    
    override class func classFunc() {
    
    }
    
    private func privateFunc() {
        
        self.publicVar = "public"
        print(self.publicVar)
        
        self.internalVar = "internal"
        print(self.internalVar)
        
        self.fileprivateVar = "fileprivate"
        print(self.fileprivateVar)  // fileprivate can be inherited in the same file, but can not access in the other file
        
        // self.privateVar = "private"
        // print(self.privateVar)  private can not be inherited
    }
    
}



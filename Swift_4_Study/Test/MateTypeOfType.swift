//
//  TypeOfType.swift
//  Swift_4_Study
//
//  Created by cooperLink on 2017/10/23.
//  Copyright © 2017年 cooperLink. All rights reserved.
//

import Foundation

protocol ProtocolType {
    
}

struct MatetypeOfType {
    
    static func test() {
        print(StringForSwiftFour.self)
        print(type(of: StringForSwiftFour()))
        print(type(of: StringForSwiftFour.self))
        
        let strStruct = StringForSwiftFour() as Any
        
        print((strStruct is StringForSwiftFour) ? "true" : "false")
        //        print((strStruct is StringForSwiftFour.self) ? "true" : "false")
        
        let mateType: DeferAndQueue.Type = DeferAndQueue.self
        print(mateType)
        print(type(of: DeferAndQueue()))
        print(type(of: DeferAndQueue.self))
        let mateTypeOfType: DeferAndQueue.Type.Type = type(of: mateType)
        print(mateTypeOfType)

        let mateTypeProtocol: ProtocolType.Protocol  = ProtocolType.self
        print(mateTypeProtocol)
        let typeOf = type(of: ProtocolType.self)
        print(typeOf)
        
    }
}



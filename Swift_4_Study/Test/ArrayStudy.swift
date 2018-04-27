//
//  ArrayStudy.swift
//  Swift_4_Study
//
//  Created by aiait on 2018/4/26.
//  Copyright © 2018年 cooperLink. All rights reserved.
//

import Foundation

final class ArrayStudy {
    
    static func testStatic() {
        
    }
    
    class func testFlatMap() {
        let arr0 = [[1, 2], [3, 4, 5]]
        
        // flat map
        let flatMapArr = arr0.flatMap{$0}
        print("flat map -> \(flatMapArr)")
        
        // map
        let mapArr = arr0.map{$0}
        print("map -> \(mapArr)")
        
        
        let a = arr0.flatMap { (intArr) -> [Int] in
            return intArr
        }
        print(a)
        
        let arr1 = [[1, 2], nil, [3, nil, 4]]
        
        // map optional
        let mapOptional = arr1.map{$0}
        print("map optional -> \(mapOptional)")
        
        // flat map
//        let flatMapOArr = arr1.flatMap{$0?.compactMap{$0}}
//        print("flat map optional -> \(flatMapOArr)")
        
        // compact Map
        let compactMapArr = arr1.compactMap{$0?.compactMap{$0}}
        print("compact Map -> \(compactMapArr)")

        let dictionary = [1 : "One",
                          2 : "Two"]
        let dicMap = dictionary.map{[$0, $1]}
        print(dicMap)
        
        
        
    }
    
    
//    struct Person {
//        var age: Int
//        var name: String
//    }
//    
//    func getAges(people: [Person]) -> [Int] {
//        return people.flatMap { $0.age }
//    }
    
}


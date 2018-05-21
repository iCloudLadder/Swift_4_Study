//
//  ArrayStudy.swift
//  Swift_4_Study
//
//  Created by aiait on 2018/4/26.
//  Copyright © 2018年 cooperLink. All rights reserved.
//

import Foundation

final class ArrayStudy {
    
    static func testReduce() {
        let arr0: [Any] = [1, [2, 3]]
        let reduuceArr = [4] as [Any]
        let arrReduce = arr0.reduce(reduuceArr) {
            print("a = \($0), b = \($1)")
            return $0 + [$1]
        }
        
        print(arrReduce)
//        ManagedBuffer<Int>.create(minimumCapacity: 3) {_ in
//            0
//        }
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
    
    
    
    static func testVaule() {
        let arr0 = [1, 2, 3]
        addElement(arr: arr0, element: 4)
        print("arr0 = \(arr0)")
    }
    
    private static func addElement<T>(arr: [T], element: T) {
       let afterArr = arr + [element]
        print("afterArr = \(afterArr)")
    }
    
}



//extension Dictionary where Key == String, Value == Any  {
//    func testA()  {
//        let a = self;
//        print(<#T##items: Any...##Any#>)
//    }
//}












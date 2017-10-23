//
//  DeferAndQueue.swift
//  Swift_4_Study
//
//  Created by cooperLink on 2017/10/23.
//  Copyright © 2017年 cooperLink. All rights reserved.
//

import Foundation

final class DeferAndQueue {
    
    static func test() {
        // defer
        testDefer()
        
        print("================================")
        
        // DispatchMainQueue
        testQueue()
    }
    
    /*
     ===> defer start
     <=== defer end
     --> 3
     --> 2
     --> 1
     --> 1.x
     -->1.2
     -->1.1
     -->1.0
     --> 0
     */
    static private func testDefer() {
        print("===> defer start")
        
        defer {
            print("--> 0")
        }
        
        defer {
            defer {
                print("-->1.0")
            }
            print("--> 1")
            defer {
                print("-->1.1")
            }
            print("--> 1.x")
            defer {
                print("-->1.2")
            }
        }
        
        defer {
            print("--> 2")
        }
        
        defer {
            print("--> 3")
        }
        
        
        print("<=== defer end")
    }
    
    /*
     ===> mainQueue start
     <=== mainQueue end
     mainQueue -> 0
     mainQueue -> 1
     mainQueue -> 1.x
     mainQueue -> 2
     mainQueue -> 3
     mainQueue -> 1.0
     mainQueue -> 1.1
     mainQueue -> 1.2
     */
    static private func testQueue() {
        
        print("===> mainQueue start")
        
        DispatchQueue.main.async {
            print("mainQueue -> 0")
        }
        
        DispatchQueue.main.async {
            DispatchQueue.main.async {
                print("mainQueue -> 1.0")
            }
            print("mainQueue -> 1")
            DispatchQueue.main.async {
                print("mainQueue -> 1.1")
            }
            print("mainQueue -> 1.x")
            DispatchQueue.main.async {
                print("mainQueue -> 1.2")
            }
        }
        
        DispatchQueue.main.async {
            print("mainQueue -> 2")
        }
        
        DispatchQueue.main.async {
            print("mainQueue -> 3")
        }
        print("<=== mainQueue end")
    }
}



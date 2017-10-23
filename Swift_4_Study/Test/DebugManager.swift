//
//  DebugManager.swift
//  Swift_4_Study
//
//  Created by cooperLink on 2017/10/23.
//  Copyright © 2017年 cooperLink. All rights reserved.
//

import Foundation


func printl(_ items: Any..., fileName: String = #file, funcName: String = #function, line: Int = #line, column: Int = #column) {
    print(items, terminator: ", ")
    print("fileName = \(fileName), functionName = \(funcName), line = \(line), column = \(column)")
}


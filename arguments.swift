#!/usr/bin/env xcrun swift

//
//  test.swift
//  
//
//  Created by Michael Mayer on 9/5/16.
//
//

import Foundation

print(Process.argc)
for i in 0..<Process.argc {
	print(Process.arguments[Int(i)])
}


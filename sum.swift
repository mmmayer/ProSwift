#!/usr/bin/env xcrun swift

var total : Int = 0
 
for i in 1..<Process.argc {
	if let argInt = Int(Process.arguments[Int(i)]) {
      total += argInt
    }
}
for i in 1..<Process.argc - 1 {
	print(Process.arguments[Int(i)] + " + ", terminator: "")
}
print(Process.arguments[Int(Process.argc - 1)] + " = " + "\(total)")
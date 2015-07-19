//: Playground - noun: a place where people can play

import Cocoa

class Student: NSObject {
    var name = ""
    var gradeLevel = 0
}

let s = Student()
s.setValue("kelly", forKey: "name")
s.setValue(3, forKey: "gradeLevel")


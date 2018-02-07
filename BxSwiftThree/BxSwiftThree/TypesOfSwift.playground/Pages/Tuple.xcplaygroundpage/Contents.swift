//: Playground - noun: a place where people can play

import UIKit

// Int おすすめ
Int.min
Int.max

Int64.min
Int64.max

var gree = 3_000_000

var three = 3
type(of: three)

var PI = 3 + 0.14
type(of: PI)

//PI = three + 0.14

// Tuple： 对数据进行简单打包处理用
let success = (200, "HTTP OK")
let fileNotFound = (404, "File not found")
let redirect: (Int, String) = (302, "Temporary redirect")
success.0
success.1

let me = (name:"Lora", no: 11, email: "Lora@boxue.io")
me.name
me.no
me.email

// Tuple decoposition
var (successCode, successMessage) = success
successCode
successMessage

successCode = 201
success

let (_, erroMessage) = fileNotFound
erroMessage

let tuple11 = (1, 1)
let tuple12 = (1, 2)
let tuple31 = (3, 1)
tuple11 < tuple12
tuple31 > tuple12

let tuple123 = (1, 2, 3)
//tuple12 == tuple123       // tuple之间相比较时，个数要相等

let largeTuple1 = (1, 2, 3, 4, 5, 6, 7)
let largeTuple2 = (1, 2, 3, 4, 5, 6, 7)
//largeTuple1 == largeTuple2        // 两个tuple相比较时，每个tuple最多能有6个元素



//: #Heading1

/*:
 * item1
 * item2
 * item3
 */



 

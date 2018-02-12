//: Playground - noun: a place where people can play

import UIKit

var fibonacci = [0, 1, 2, 3, 4, 5]
var squares = [Int]()

for value in fibonacci {
    squares.append(value * value)
}

let constSquares = fibonacci.map { $0 * $0 }
print(fibonacci.min() ?? 0)
print(fibonacci.max() ?? 0)

let result1 = fibonacci.elementsEqual([0, 1, 2], by: { $0 == $1 })
let result2 = fibonacci.starts(with: [0, 1], by: { $0 == $1 })
print(result1)
print(result2)

fibonacci.forEach {
    print($0)
}

let bonacci = fibonacci.sorted()
print(bonacci)
let sortFibonacci = fibonacci.sorted(by: >)
print(sortFibonacci)

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
                  5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine" ]
var numbers = [16, 58, 510]
let strings = numbers.map { num -> String in
    var number = num
    var output = ""
    repeat {
        if let value = digitNames[number % 10] {
            output = value + output
        }
        number /= 10
    } while number > 0
    print("output = \(output)")
    return output
}
let newNumbers = numbers.map { _ in
    return 0
}
print(numbers)  // [16, 58, 510]
print(newNumbers)   // [0, 0, 0]

let fruits = ["apple", "banana", "orange", ""]
let counts = fruits.map { fruit -> Int? in
    let length = fruit.count
    guard length > 0 else { return nil}
    return length
}
print(counts)   // [Optional(5), Optional(6), Optional(6), nil]

let flatMapCounts = fruits.flatMap { fruit -> Int? in
    let length = fruit.count
    guard length > 0 else { return nil}
    return length
}
print(flatMapCounts)    // [5, 6, 6]

let array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let arrayMap = array1.map { $0 }
print(arrayMap)     // [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let arrayFloatMap = array1.flatMap { $0 }
print(arrayFloatMap)    // [1, 2, 3, 4, 5, 6, 7, 8, 9]

let numbers2 = [1, 2, 3, 4, 5, 6]
let evens = numbers2.filter { $0 % 2 == 0 } // 去掉数组中不需要的值
print(evens)

let sum = numbers2.reduce(0) { $0 + $1 }
let sums = numbers2.reduce(0, +)

let sum1 = numbers2.reduce(0) { total, num in
    return total + num
}
print(sum)
print(sum1)

let tel = numbers2.reduce("") {
    "\($0)" + "\($1)"
}
print(tel)

let pivot = fibonacci.partition(by: { $0 < 1 })
print(pivot)
print(fibonacci)
print(fibonacci[0 ..< pivot])
print(fibonacci[pivot ..< fibonacci.endIndex])

var aSum = 0
let constSquares2 = fibonacci.map { (fib: Int) -> Int in
    aSum += fib     // 不好的做法
    return fib * fib
}
print(aSum)

extension Array {
    func accumulate<T>(_ initial: T,
                       _ nextSum: (T, Element) -> T) -> [T] {
        var bSum = initial
        return map { next in
            bSum = nextSum(bSum, next)
            return bSum
        }
    }
}
print(fibonacci.accumulate(0, +))

var fiveInts = [1, 2, 3, 4, 5]

for (index, value) in fiveInts.enumerated() {
    print("\(index) : \(value)")
}

fiveInts.forEach {
    $0 * 2
}
print(fiveInts)

fiveInts.append(6)
print(fiveInts)
fiveInts.insert(88, at: fiveInts.startIndex)
print(fiveInts)
fiveInts.removeFirst()
print(fiveInts)

fiveInts += [3, 6]
print(fiveInts)

var a = [1, 2, 3]
let copyA = a
a.append(4)

func getBufferAddress<T>(array: [T]) -> String {
    return array.withUnsafeBufferPointer {
        return String(describing: $0)
    }
}

getBufferAddress(array: a)
getBufferAddress(array: copyA)
a.append(5)
getBufferAddress(array: a)
getBufferAddress(array: copyA)

let b = NSMutableArray(array: [1, 2, 3])
let copyB: NSArray = b
let deepCopyB = b.copy() as! NSArray
b.insert(34, at: 0)
copyB
deepCopyB
let oneIndex = a.index{
    $0 == 3
}
oneIndex
a.first
a.last
a.removeLast()
a.popLast()

var fibno = [0, 1, 2, 3, 4, 5]
print(fibno.filter { $0 % 2 == 0 })

extension Array {
    func arrayFilter(_ predicate: (Element) -> Bool) -> [Element] {
        var tmp: [Element] = []
        for value in self where predicate(value) {
            tmp.append(value)
        }
        return tmp
    }
    
    func reject(_ predicate: (Element) -> Bool) -> [Element] {
        return filter { !predicate($0) }
    }
    
    func allMatch(_ predicate: (Element) -> Bool) -> Bool {
        return contains{ predicate($0) }
    }
    
    func myReduce<T>(_ initial: T, _ next: (T, Element) -> T) -> T {
        var tmp = initial
        for value in self {
            tmp = next(tmp, value)
        }
        return tmp
    }
    
    func myFileter2(_ predicate: (Element) -> Bool) -> [Element] {
        return reduce([], { predicate($1) ? $0 + [$1] : $0 })
    }
    
    func myMap2<T>(_ transform: (Element) -> T) -> [T] {
        return reduce([], {$0 + [transform($1)]})
    }
}

print(fibno.arrayFilter{ $0 % 2 == 0 })
print(fibno.contains {$0 % 2 == 0})
print(fibno.reject{ $0 % 2 == 0 })
let aa = [2, 4, 6].allMatch({ $0 % 2 == 0 })
print(aa)

fibno.reduce(0, +)
fibno.myReduce(0, +)
let reduceStr = fibno.myReduce("") { $0 + "\($1)" }
print(reduceStr)
let filterReturn = fibno.myFileter2(){ $0 % 2 == 0 }
print(filterReturn)
let mapResult = fibno.myMap2 { $0 * $0 }
print(mapResult)

enum RecordType {
    case bool(Bool)
    case number(Int)
    case text(String)
}

let record11: [String: RecordType] = [
    "uuid": .number(11),
    "exp": .number(100),
    "favorite": .bool(false),
    "title": .text("Dicitionary basics")
]
record11["uuid"]
record11["exp"]
record11["favorite"]
record11["title"]

type(of: record11["invalid"])

record11.count
record11.isEmpty
record11.keys.forEach { print($0) }
record11.values.forEach { print($0) }

var recorder10 = record11
recorder10["favorite"] = .bool(true)
record11["favorite"]

recorder10.updateValue(.bool(false), forKey: "favorite")
recorder10["watchLater"] = .bool(false)
recorder10
recorder10["watchLater"] = nil
recorder10

for (k, v) in recorder10 {
    print("\(k): \(v)")
}
recorder10.forEach { "\($0): \($1)" }


enum RecordTypeT {
    case bool(Bool)
    case number(Int)
    case text(String)
}

let defaultRecord: [String:  RecordTypeT] = [
    "uid": .number(0),
    "exp": .number(100),
    "favourite": .bool(false),
    "title": .text("")
]

var template = defaultRecord
let record11Patch: [String: RecordTypeT] = [
    "uuid": .number(1),
    "title": .text("Common dictionary extensions")
]

extension Dictionary {
    mutating func merger<S: Sequence>(_ sequence: S) where S.Iterator.Element == (key: Key, value: Value) {
        sequence.forEach { self[$0] = $1 }
    }
    
    init<S: Sequence>(_ sequence: S) where S.Iterator.Element == (key: Key, value: Value) {
        self = [:]
        self.merger(sequence)
    }
    
    func mapValue<T>(_ transform: (Value) -> T) -> [Key: T] {
        return Dictionary<Key, T>(map { ($0, transform($1)) })
    }
}

template.merger(record11Patch)

let record10Path: [(key: String, value: RecordTypeT)] = [
    (key: "uuid", value: .number(10)),
    (key: "title", value: .text("Common dictionary extensions array"))
]
var template1 = defaultRecord
template1.merger(record10Path)

let record11PatchDic = Dictionary(record11Patch)
record11PatchDic
print(record11PatchDic.map { $1 })

let record1 = record11PatchDic.mapValue { record -> String in
    switch record {
    case .text(let title):
        return title
    case .number(let exp):
        return String(exp)
    case .bool(let favourite):
        return String(favourite)
    }
}
record1

// 让dictiona有序排列
record1.keys.sorted().forEach {
    print("\($0): \(record1[$0])")
}

//  ----------------
struct Account {        // 不要使用引用类型（class）作为dictionary的key
    var type: Int
    var alias: String
    var createdAt: Date
    
    let INT_BIT = (Int)(CHAR_BIT) * MemoryLayout<Int>.size
    
    func bitwiseRotate(value: Int, bits: Int) -> Int {
        return (value << bits) | (value >> (INT_BIT - bits))
    }
}

extension Account: Hashable {
    var hashValue: Int {
        // a ^ b == b ^ a
        //        return type.hashValue ^ alias.hashValue ^ createdAt.hashValue
        return bitwiseRotate(value: type.hashValue, bits: 10) ^ alias.hashValue ^ createdAt.hashValue
    }
}
extension Account: Equatable {      // 两个相等对象的哈希值必须相等
    // ==
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.type == rhs.type &&
            lhs.alias == rhs.alias &&
            lhs.createdAt == rhs.createdAt
    }
}

var data: [Account: Int]?

// Set: 包含不重复值的，无需集合
var vowel: Set<Character> = ["a", "e", "i", "o", "u"]
vowel.count
vowel.isEmpty
vowel.contains("a")
vowel.remove("e")
vowel.insert("a")
//vowel.removeAll()

for character in vowel.sorted() {
    print(character)
}
print("-------")
vowel.forEach { print($0) }

var setA: Set = [1, 2, 3, 4, 5, 6]
var setB: Set = [4, 5, 6, 7, 8, 9]
let interSectAB = setA.intersection(setB)   // 交集
let unionAB = setA.union(setB)      // 并集
let symmetricDiffAB = setA.symmetricDifference(setB)        // 对称差
let aSubtractB = setA.subtracting(setB)     // 集合A中减去集合B的内容
setA.formIntersection(setB)     // 修改set自身

// 利用set属性，做去重操作
extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var tmp: Set<Iterator.Element> = []
        return filter {
            if tmp.contains($0) {
                return false
            } else {
                tmp.insert($0)
                return true
            }
        }
    }
}

[1, 1, 2, 2, 3, 3, 4, 4].unique()

// SetAlgebra

// IndexSet     1 ... 6 (范围)    范围大时用它经济
// Set<Int>     1, 2, 3, 4, 5, 6 （具体值）
let oneToSix: IndexSet = [1, 2, 3, 4, 5, 6]

// CharacterSet
let hw = "Hellow World!"
let numberss = CharacterSet(charactersIn: "123456789")
let letters = CharacterSet.letters

hw.rangeOfCharacter(from: numberss)
hw.rangeOfCharacter(from: letters)

func makeCounter() -> () -> Int {
    var value = 0
    return {
        value += 1
        return value
    }
}
let counter1 = makeCounter()
let counter2 = makeCounter()
(0...2).forEach { _ in print(counter1) }
(0...5).forEach { _ in print(counter2) }

func makeCounter2() -> () -> Int {
    var value = 0
    func increment() -> Int  {
        value += 1
        return value
    }
    return increment
}
let counter3 = makeCounter2()
let counter4 = makeCounter2()
(0...2).forEach { _ in print(counter3) }
(0...5).forEach { _ in print(counter4) }


//: Playground - noun: a place where people can play

import UIKit

var light = "red"
var action = ""
switch light {
case "red":
    action = "stop"
case "yelllow":
    action = "caution"
case "green":
    action = "go"
default:
//    action = "invalidate"
    break
}

let vowel = ["a", "e", "i", "o", "u"]
for char in vowel {
    print(char)
}
for number in 1 ... 10 {
    if number % 2 != 0 { continue }
    if number > 8 { break }
    print(number)
}

var i = 0
while i < 10 {
    i += 1
    print(i)
}

repeat {
    print(i)
    i -= 1
} while i > 0

// 3: 简单样式匹配
let origin = (x: 0, y: 0)   // tuple
let pt1 = (x: 0, y: 0)
if pt1.x == origin.x && pt1.y == origin.y {
    print("@Origin")
}
if case(0, 0) = pt1 {
    print("@Origin")
}
switch pt1 {
case (0, 0):
    print("@origin")
case (_, 0):
    print("on x axis")
case (0, _):
    print("on y axis")
case (-1...1, -1...1):
    print("inside 2x2 square")
default:
    break
}

let array1 = [1, 3, 2, 2, 2]
for case 2 in array1 {
    print("found two")
}

switch pt1 {
case (let x, 0):
    print("(\(x), 0) is on x axis")
case (0, let y):
    print("(0, \(y) is on y axis")
default:
    break
}

enum Direction {
    case north, south, east, west(abbr: String)
}
let west = Direction.west(abbr: "W")
if case .west = west {
    print(west)
}
if case .west(let direction) = west {
    print(direction)
}

let skills: [String?] = ["Swift", nil, "PHP", "JavaScript", nil]
for case let skill? in skills {
    print(skill)
}

let someValues: [Any] = [1, 1.0, "One"]
for value in someValues {
    switch value {
    case let v as Int:
        print("Integer \(v)")
    case let v as Double:
        print("Double \(v)")
    case let v as String:
        print("String \(v)")
    default:
        break
    }
}
for value in someValues {
    switch value {
    case is Int:
        print("Integer")
    case is Double:
        print("Double")
    case is String:
        print("String")
    default:
        break
    }
}

for i in 1...10 where i % 2 == 0 {
    print(i)
}
enum Power {
    case fullyCharged
    case normal(percentage: Double)
    case outOfPower
}
let battery = Power.normal(percentage: 0.1)
switch battery {
case .normal(let percentage) where percentage <= 0.1:
    print("Almost out of power")
case .normal(let percentage) where percentage >= 0.8:
    print("Almost fully charged")
default:
    print("Normal battery status")
}

let halfPower = Power.normal(percentage: 0.5)
switch halfPower {
case .fullyCharged, .outOfPower:
    print("Fully charged or out of power")
default:
    break
}
if case .normal(let percentage) = battery, case 0...0.1 = percentage {
    print("Almost out of power")
}

let username = "11@boxue.io"
let password = 1111111
let age = 35
if username == "11@boxue.io" && password == 1111111 && age == 35 {
    print("correct")
}
if case ("11@boxue.io", 1111111, 35) = (username, password, age) {
    print("tuple correct")
}

func mul(multiplicand m: Int, of n: Int) {
    print(m * n)
}
mul(multiplicand: 2, of: 3)
func mul1(_ m: Int, of n: Int) {
    print(m * n)
}
mul1(5, of: 4)
func mul2(_ m: Int, of n: Int = 1) {
    print(m * n)
}
mul2(3)

func mul3(_ numbers: Int ...) {
    let arrayMul = numbers.reduce(1, *)
    print("mul3: \(arrayMul)")
}
mul3(2, 3, 4, 5, 6, 7)

func mul4(result: inout Int, _ numbers: Int ...) {
    result = numbers.reduce(1, *)
    print("mul4: \(result)")
}
var result = 0
mul4(result: &result, 2, 3, 4, 5, 6, 7)

func mul5(_ numbers: Int ...) -> Int {
    return numbers.reduce(1, *)
}
let relt = mul5(2, 3, 4, 5, 6, 7)

func cal<T>(_ first: T,
            _ second: T,
            _ fn: (T, T) -> T) -> T {
    return fn(first, second)
}
func muls(m: Int, of n: Int) -> Int {
    return m * n
}
cal(2, 3, muls)
func mul6(_ a: Int) -> (Int) -> Int {
    func innerMul(_ b: Int) -> Int {
        return a * b
    }
    return innerMul
}
let mul2By = mul6(2)
mul2By(3)
mul6(2)(3)

func makeCounter() -> () -> Int {
    var value = 0
    return {
        value += 1
        return value
    }
}
let counter1 = makeCounter()
let counter2 = makeCounter()
(0...2).forEach { _ in print(counter1()) }
(0...5).forEach { _ in print(counter2()) }

func makeCounter2() -> () -> Int {
    var value = 0
    func increment() -> Int {
        value += 1
        return value
    }
    return increment
}
let counter3 = makeCounter2()
let counter4 = makeCounter2()
(0...2).forEach { _ in print(counter3()) }
(0...5).forEach { _ in print(counter4()) }

extension Array where Element: Comparable {
    mutating func mergeSort(_ begin: Index, _ end: Index) {
        if (end - begin) > 1 {
            let mid = (begin + end) / 2
            mergeSort(begin, mid)
            mergeSort(mid, end)
            
        }
    }
    private mutating func merge(_ begin: Index, _ mid: Index, _ end: Index) {
        var tmp: [Element] = []
        var i = begin
        var j = mid
        while i != mid && j != end {
            if self[i] < self[j] {
                tmp.append(self[i])
                i += 1
            } else {
                tmp.append(self[j])
                j += 1
            }
        }
        tmp.append(contentsOf: self[i ..< mid])
        tmp.append(contentsOf: self[j ..< end])
        replaceSubrange(begin..<end, with: tmp)
    }
    
    mutating func mergeSort2(_ begin: Index, _ end: Index) {
        var tmp: [Element] = []
        tmp.reserveCapacity(count)
        func merge2(_ begin: Int, _ mid: Int, _ end: Int) {
            tmp.removeAll(keepingCapacity: true)
//            var i = begin
//            var j = mid
            // ...
        }
        if ((end - begin) > 1) {
            let mid = (begin + end) / 2
            mergeSort2(begin, mid)
            mergeSort2(mid, end)
            merge(begin, mid, end)
        }
    }
}

final class Episode: NSObject {     // final: 不能被继承
    var title: String
    @objc var type: String
    @objc var length: Int
    override var description: String {
        return title + "\t" + type + "\t" + String(length)
    }
    init(title: String, type: String, length: Int) {
        self.title = title
        self.type = type
        self.length = length
    }
}
let episodes = [
    Episode(title: "title 1", type: "Free", length: 520),
    Episode(title: "title 4", type: "Paid", length: 500),
    Episode(title: "title 2", type: "Free", length: 330),
    Episode(title: "title 5", type: "Paid", length: 260),
    Episode(title: "title 3", type: "Free", length: 240),
    Episode(title: "title 6", type: "Paid", length: 390)
]

let typeDescriptor = NSSortDescriptor(key: #keyPath(Episode.type), ascending: true, selector: #selector(NSString.localizedCompare(_:)))
var descriptors = [typeDescriptor]
//let sortedEpisodes = (episodes as NSArray).sortedArray(using: descriptors)
//sortedEpisodes.forEach { print($0 as! Episode) }
let lengthDescriptor = NSSortDescriptor(key: #keyPath(Episode.length), ascending: true)
descriptors.append(lengthDescriptor)
let sortedepisode = (episodes as NSArray).sortedArray(using: descriptors)
sortedepisode.forEach{ print($0 as! Episode) }

typealias SortDescriptor<T> = (T, T) -> Bool
let stringDescriptor: SortDescriptor<String> = {
    $0.localizedCompare($1) == .orderedAscending
}
let lenghtDescriptor: SortDescriptor<Episode> = {
    $0.length < $1.length
}
///-----> From
func makeDescriptor<Key, Value>(key: @escaping (Key) -> Value,
                                _ isAscending: @escaping (Value, Value) -> Bool) -> SortDescriptor<Key> {
    return { isAscending(key($0), key($1)) }
}
///-----> To
let lenghtDescriptor2: SortDescriptor<Episode> = makeDescriptor(key: { $0.length }, <)
let typeDescriptor2: SortDescriptor<Episode> = makeDescriptor(key: { $0.type }, {
    $0.localizedCompare($1) == .orderedAscending
})
episodes.sorted(by: typeDescriptor2).forEach { print($0) }

func combine<T>(rules: [SortDescriptor<T>]) -> SortDescriptor<T> {
    return { l, r in
        for rule in rules {
            if rule(l, r) {
                return true
            }
            if rule(r, l) {
                return false
            }
        }
        return false
    }
}
let mixDescriptor = combine(rules: [typeDescriptor2, lenghtDescriptor2])
episodes.sorted(by: mixDescriptor).forEach {
    print($0)
}

let numbers = ["Five", "4", "9", "2", "1"]
//let intDescriptor: SortDescriptor<String> = makeDescriptor(key: {  Int($0) }, <)

//let intDescriptor: SortDescriptor<String> = makeDescriptor(key: { Int($0) }, {
//    return { l, r in
//        switch (l, r) {
//        case (nil, nil):
//            return false
//        case (nil, _):
//            return false
//        case (_, nil):
//            return true
//        case let (l?, r?):
//            return l < r
//        default:
//            fatalError()
//        }
//    }
//})

func shift<T: Comparable>(_ compare: @escaping (T, T) -> Bool) -> (T?, T?) -> Bool {
    return { l, r in
        switch (l, r) {
        case (nil, nil):
            return false
        case (nil, _):
            return false
        case (_, nil):
            return true
        case let (l?, r?):
            return compare(l, r)
        default:
            fatalError()
        }
    }
}
let intDescriptor: SortDescriptor<String> = makeDescriptor(key: { Int($0) }, shift(<))
numbers.sorted(by: intDescriptor).forEach {
    print($0)
}

infix operator |>: LogicalDisjunctionPrecedence
func |><T>(l: @escaping SortDescriptor<T>,
           r: @escaping SortDescriptor<T>) -> SortDescriptor<T> {
    return {
        if l($0, $1) {
            return true
        }
        
        if l($1, $0) {
            return false
        }
        
        if r($0, $1) {
            return true
        }
        
        return false
    }
}
episodes.sorted(by: typeDescriptor2 |> lenghtDescriptor2).forEach {
    print($0)
}

@objc protocol PersonProtocol: class {
    func getName()
    @objc optional func getAge(age: Int)
}

class Person: PersonProtocol {
    func getName() {
    }
}

protocol FinishAlertViewDelegate: class {
    func buttonPressed(at indext: Int)
}
class FinishAlertView {
    var buttons: [String] = ["Cancel", "The next"]
    weak var delegate: FinishAlertViewDelegate?
    
    func gotoTheNext() {
        delegate?.buttonPressed(at: 1)
    }
}
class EpisodeViewController: FinishAlertViewDelegate {
    var episodeAlert: FinishAlertView!
    
    init() {
        self.episodeAlert = FinishAlertView()
        self.episodeAlert.delegate = self
    }
    
    func buttonPressed(at indext: Int) {
        print("Go to the next episode...")
    }
}
let evc = EpisodeViewController()
evc.episodeAlert.gotoTheNext()
evc.episodeAlert.gotoTheNext()

protocol FinishAlertViewDelegate2 {
    mutating func buttonPressed2(at index: Int)
}
class FinishAlertView2 {
    var delgate: FinishAlertViewDelegate2?
    
    func gotoTheNext() {
        delgate?.buttonPressed2(at: 1)
    }
}
struct PressCounter2: FinishAlertViewDelegate2 {
    var count = 0
    
    mutating func buttonPressed2(at indext: Int) {
        self.count += 1
    }
}
class EpisodeViewController2 {
    var alertView: FinishAlertView2!
    var counter: PressCounter2!
    
    init() {
        alertView = FinishAlertView2()
        counter = PressCounter2()
        alertView.delgate = counter
    }
}
let evc2 = EpisodeViewController2()
evc2.alertView.gotoTheNext()
evc2.alertView.gotoTheNext()
evc2.alertView.gotoTheNext()
evc2.alertView.gotoTheNext()
evc2.alertView.gotoTheNext()

evc2.counter.count
(evc2.alertView.delgate as! PressCounter2).count

/* 是delegate protocol，还是callback？*/
class FinishAlertView3 {
    var buttons: [String] = ["Cancel", "The next"]
    var buttonPressed: ((Int) -> Void)?
    
    func gotoTheNext() {
        self.buttonPressed?(1)
    }
}
struct PressCounter3 {
    var count = 0
    
    mutating func buttonPressed(at Index: Int) {
        self.count += 1
    }
}
let fav = FinishAlertView3()
var counter = PressCounter3()
//fav.buttonPressed = counter.buttonPressed     -> NG
fav.buttonPressed = {
    counter.buttonPressed(at: $0)
}
fav.gotoTheNext()
fav.gotoTheNext()
fav.gotoTheNext()
fav.gotoTheNext()
counter.count

class PressCounter4 {
    var count = 0
    
    func buttonPressed(at Index: Int) {
        self.count += 1
    }
}
var pc4 = PressCounter4()
//fav.buttonPressed = pc4.buttonPressed     -> NG
fav.buttonPressed = { [weak pc4] index in
    pc4?.buttonPressed(at: index)
}

/*被绝大多数人误会了的inout参数*/
func incremental(_ i: inout Int) -> Int {
    i = i + 1
    return i
}
var ii = 0
incremental(&ii)
//let ij = 0
//incremental(&ij)
var nums = [1, 2, 3]
incremental(&nums[1])
struct Color {
    var r: Int
    var g: Int
    var b: Int
    
    var hex: Int {
        return r << 16 + g << 8 + b
    }
}
var red = Color(r: 254, g: 0, b: 0)
incremental(&red.r)
//incremental(&red.hex)

prefix func ++(i: inout Int) -> Int {
    i += 1
    return i
}
++ii
var mn = 0
func doubleIncrement(_ i: inout Int) {
    func increment() {
        i += 1
    }
    [0, 1].forEach { _ in
        increment()
    }
}
doubleIncrement(&mn)
// 我们不能通过内嵌函数，让inout参数逃离函数的作用域
//func increments(_ i: inout Int) -> () -> Void {
//    return {
//        i += 1
//    }
//}

func incrementByReference(_ pointer: UnsafeMutablePointer<Int>) {
    pointer.pointee += 1
}
incrementByReference(&mn)
func incrementByReference2(_ pointer: UnsafeMutablePointer<Int>) -> () -> Int {
    return {
        pointer.pointee += 1
        return pointer.pointee
    }
}
let boom: () -> Int
if true {
    var j = 0
    boom = incrementByReference2(&j)
}
//boom()        // 不要让接受指针参数的函数返回另外一个函数

/* @autoClosure */
let nbers: [Int] = [1, 2, 3]
if !nbers.isEmpty && nbers[0] > 0 {
    //
}
func logicAnd(_ l: Bool, _ r: Bool) -> Bool {
    guard l else { return false }
    return r
}
let nbers2: [Int] = []
if !nbers2.isEmpty && nbers2[0] > 0 {
    //
}
//if logicAnd(!nbers2.isEmpty, nbers2[0] > 0) {
//    // failed outofRange
//}
func logicAnd2(_ l: Bool, _ r: () -> Bool) -> Bool {
    guard l else { return false }
    return r()
}
if logicAnd2(!nbers2.isEmpty, { nbers2[0] > 0 }) {
    // success
}

func logicAnd3(_ l: Bool, _ r: @autoclosure () -> Bool) -> Bool {
    guard l else { return false }
    return r()
}
if logicAnd3(!nbers2.isEmpty, nbers2[0] > 0) {
    
}

// capture list: 参数列表

func calc(_ n: Int, by: ((Int) -> Int)?) -> Int {
    guard let by = by else { return n }
    return by(n)
}




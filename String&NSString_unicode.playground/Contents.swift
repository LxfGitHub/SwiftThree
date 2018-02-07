//: Playground - noun: a place where people can play

import UIKit

let cafe = "Caf\u{00e9}"
let cafee = "Caf\u{0065}\u{0301}"
cafe.characters.count
cafee.characters.count

cafe.utf8.count
cafee.utf8.count

cafe.utf16.count
cafee.utf16.count

cafe == cafee

let nsCafe = NSString(characters: [0x43, 0x61, 0x66, 0xe9], length: 4)
let nsCafee = NSString(characters: [0x43, 0x61, 0x66, 0x65, 0x0301], length: 5)
nsCafe.length
nsCafee.length

nsCafe == nsCafee

let result = nsCafe.compare(nsCafee as String)
result == .orderedSame

let circleCafee = cafe + "\u{20dd}"
circleCafee.characters.count

"🙆🏻‍♀️".characters.count
"👨‍👩‍👧‍👧".characters.count
"👩\u{200D}👩\u{200D}".characters.count


extension String: Collection {
    
}

var swifts = "Swift is fun"
swifts.dropFirst(9)

let groups = "👩‍👩‍👧‍👦"
groups.dropFirst()

let cafees = "caf\u{0065}\u{0301}"
cafees.dropFirst()

cafees.unicodeScalars.forEach{ print($0) }
cafees.utf8.forEach{ print($0) }
cafees.utf16.forEach{ print($0) }

cafees.unicodeScalars.dropLast()
cafees.utf16.dropLast()
cafees.utf8.dropLast()

cafees.characters
cafees.characters.count

cafees.characters.startIndex
cafees.characters.endIndex

////let index = cafees.index(cafees.characters.startIndex, offsetBy: 3, limitedBy: cafees.endIndex)
////cafees[index!]
////
////extension String {
////    subscript(index: Int) -> Character {
////        guard let index = self.index(startIndex, offsetBy: index, limitedBy: endIndex) else {
////            fatalError("String index out of range)
////        }
////        return self[index]
////    }
////}
//
//cafees[3]
//
//for i in 0..<4 {
//    print(cafees[i])
//}

let mCafee = "caf\u{0065}\u{0301}"

let beg = mCafee.startIndex
let end = mCafee.index(beg, offsetBy: 3)
mCafee[beg ..< end]

String(mCafee.characters.prefix(3))



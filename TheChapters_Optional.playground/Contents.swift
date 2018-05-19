
enum Optional<T> {
    case some(T)
    case none
}
extension Array where Element: Equatable {
    func find(_ element: Element) -> Optional<Index> {
        var index = startIndex
        while index != endIndex {
            if self[index] == element {
                return Optional.some(index)
            }
            formIndex(after: &index)
        }
        return Optional.none
    }
    
    func find2(_ element: Element) -> Index? {
        var index = startIndex
        while index != endIndex {
            if self[index] == element {
                return index
            }
            formIndex(after: &index)
        }
        return nil
    }
}
var numbers = [1, 2, 3]
let index = numbers.find(4)
print(type(of: index))
//numbers.remove(at: index)
switch index {
case .some(let index):
    numbers.remove(at: index)
case .none:
    print("Not exist")
}

let nmers = [1, 2, 3, 4, 5]
var interator = numbers.makeIterator()
while let element = interator.next() {
    print(element)
}


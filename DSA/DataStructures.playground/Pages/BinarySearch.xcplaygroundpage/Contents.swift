//Pre-requisite:
// collection must conform to RandomAccessCollection protocol
// collection must be sorted
// elements must be comparable
// Complexity: O(logn)

import Foundation

extension RandomAccessCollection where Element: Comparable {
  func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
    let range = range ?? startIndex..<endIndex
    guard range.lowerBound <= range.upperBound else {
      return nil
    }
    let size = distance(from: range.lowerBound, to:range.upperBound)
    let middle = index(range.lowerBound, offsetBy: size/2)
    if self[middle] == value {
      return middle
    } else if self[middle] > value {
      return binarySearch(for: value, in: range.lowerBound..<middle)
    } else {
      return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
    }
  }
}

let array = [1,2,3,4,5,7,9,11,13,15]
print("index is: \(array.binarySearch(for: 7))")


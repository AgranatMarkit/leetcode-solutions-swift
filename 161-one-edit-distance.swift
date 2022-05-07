func oneEditApart(_ first: [Character], _ second: [Character]) -> Bool {
  oneReplaceApartOrEquals(first, second) ||
  oneDeleteApart(first, second)
}

func oneReplaceApartOrEquals(_ first: [Character], _ second: [Character]) -> Bool {
  guard first.count == second.count else { return false }
  var distance = 0
  for i in 0..<first.count {
    if first[i] != second[i] {
      distance += 1
      guard distance < 2 else { return false }
    }
  }
  return true
}

func oneDeleteApart(_ smaller: [Character], _ bigger: [Character]) -> Bool {
  guard abs(bigger.count - smaller.count) == 1 else {
    return false
  }
  guard smaller.count < bigger.count else {
    return oneDeleteApart(bigger, smaller)
  }

  // Find character to delete
  var smallerPtr = 0
  var biggerPtr = 0
  while smallerPtr < smaller.count &&
        biggerPtr < bigger.count &&
        smaller[smallerPtr] == bigger[biggerPtr] {
    smallerPtr += 1
    biggerPtr += 1
  }

  // Delete that character
  biggerPtr += 1

  // Ensure that arrays are equal after character deletion
  while smallerPtr < smaller.count && biggerPtr < bigger.count {
    if smaller[smallerPtr] != bigger[biggerPtr] {
      return false
    }
    smallerPtr += 1
    biggerPtr += 1
  }
  return true
}

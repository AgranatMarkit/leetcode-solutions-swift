class Solution {
  func multiply(_ num1: String, _ num2: String) -> String {
    if num2.count > num1.count {
      return multiply(num2, num1)
    }
    var acc = "0"
    var trailingZeros = ""
    for digit in num2.reversed() {
      acc = add(acc, trailingZeros + multiply(num1, digit.wholeNumberValue!))
      trailingZeros += "0"
    }
    return String(acc.reversed())
  }

  func multiply(_ num1: String, _ num2: Int) -> String {
    if num2 == 0 { return "0" }
    var carry = 0
    var result = ""
    for digit in num1.reversed() {
      let tmp = digit.wholeNumberValue! * num2 + carry
      result += (tmp % 10).description
      carry = tmp / 10
    }
    if carry > 0 {
      result += carry.description
    }
    return result.isEmpty ? "0" : String(result)
  }

  func add(_ num1: String, _ num2: String) -> String {
    if num2.count > num1.count {
      return add(num2, num1)
    }
    var arr1 = Array(num1)
    let arr2 = Array(num2)
    var carry = 0
    var digitIndex1 = 0
    var digitIndex2 = 0
    while digitIndex1 < arr1.count  {
      let digit1 = arr1[digitIndex1].wholeNumberValue!
      let digit2 = digitIndex2 < arr2.count ? arr2[digitIndex2].wholeNumberValue! : 0
      let tmp = carry + digit1 + digit2
      arr1[digitIndex1] = (tmp % 10).description.first!
      carry = tmp / 10
      digitIndex1 += 1
      digitIndex2 += 1
    }
    if carry > 0 {
      arr1.append(carry.description.first!)
    }
    return String(arr1)
  }
}

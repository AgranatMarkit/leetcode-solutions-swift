class Solution {
  func distance(from: Int, to: Int) -> Int {
    if to < from { return distance(from: to, to: from) }
    return to - from
  }

  func maxDistToClosest(_ seats: [Int]) -> Int {
    // Eliminate left free seats
    var firsOccupiedSeat = Int.min
    for seat in 0..<seats.count {
      if seats[seat] == 1 {
        firsOccupiedSeat = seat
        break
      }
    }

    // Eliminate right free seats
    var lastOccupiedSeat = Int.max
    for index in 0..<seats.count { // iterate from end to start
      let seat = seats.count - 1 - index
      if seats[seat] == 1 {
        lastOccupiedSeat = seat
        break
      }
    }

    let firstFreeSeatsDistance = distance(from: 0, to: firsOccupiedSeat)
    let lastFreeSeatsDistance = distance(from: lastOccupiedSeat, to: seats.count - 1)
    var maxDistance = max(1, max(firstFreeSeatsDistance, lastFreeSeatsDistance))

    guard firsOccupiedSeat != lastOccupiedSeat else { return maxDistance }

    var leftNeighbor = firsOccupiedSeat
    for seat in firsOccupiedSeat...lastOccupiedSeat {
      if seats[seat] == 1 {
        let half = (seat - leftNeighbor) / 2
        let mid = leftNeighbor + half
        let leftDistance = distance(from: leftNeighbor, to: mid)
        let rightDistance = distance(from: mid, to: seat)
        maxDistance = max(maxDistance, min(leftDistance, rightDistance))
        leftNeighbor = seat
      }
    }

    return maxDistance
  }
}

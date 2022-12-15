func quickSelect(_ nums: [Int], _ index: Int) -> Int {
  var nums = nums
  var value = -1
  
  func partition(_ startIdx: Int, _ endIdx: Int, _ randIdx: Int) -> Int {
    nums.swapAt(startIdx, randIdx)
    let pivot = startIdx
    var i = startIdx + 1, j = endIdx
    while i <= j {
      if nums[i] <= nums[pivot] {
        i += 1
      } else if nums[j] > nums[pivot] {
        j -= 1
      } else {
        nums.swapAt(i, j)
        i += 1
        j -= 1
      }
    }
    nums.swapAt(startIdx, j)
    return j
  }
  
  func helper(_ startIdx: Int, _ endIdx: Int) {
    guard startIdx <= endIdx else { return }
    let randIdx = Int.random(in: startIdx...endIdx)
    let pivot = partition(startIdx, endIdx, randIdx)
    if pivot == nums.count - k {
      value = nums[pivot]
      return
    } else if pivot < nums.count - k {
      helper(pivot + 1, endIdx)
    } else {
      helper(startIdx, pivot - 1)
    }
  }
  
  helper(0, nums.count - 1)
  return value
}

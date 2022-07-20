
indirect enum Cycle {
    case next(Int, Cycle)
    case first(Int)

    var next: Cycle? {
        if case .next(_, let cycle) = self { return cycle }
        else { return nil }
    }

    var length: Int {
        switch self {
        case .next(_, let next):
            return next.length+1
        case .first:
            return 1
        }
    }

    var debugDescription: String {
        switch self {
        case .next(let i, let next):
            return String(i) + " <-> " + next.debugDescription
        case .first(let i):
            return String(i)
        }
    }
}

func minSwapCount(_ intendedIndex: [Int]) -> Int {
    var cycleConformance: [Int?] = intendedIndex.map { _ in nil }
    var cycles: [Cycle] = []

    for n in intendedIndex.indices {
        guard cycleConformance[n] == nil else { continue }
        cycleConformance[n] = cycles.count
        var cycle = Cycle.first(n)
        var next = n
        while true {
            next = intendedIndex[next]
            if next == n { break }
            cycleConformance[next] = cycles.count
            cycle = Cycle.next(next, cycle)
        }
        cycles.append(cycle)
    }

    return cycles.reduce(0) { r, x in r + x.length - 1 }
}

func naiveMinSwapCount(_ intendedIndex: [Int]) -> Int {
    guard intendedIndex.count > 0 else { return 0 }
    var tmp = intendedIndex
    var swaps = 0
    while tmp.enumerated().contains(where: !=) {
        let (from, to) = tmp.enumerated().filter(!=).min { a, b in a.1 < b.1 }!
        let swap = tmp[from]
        tmp[from] = tmp[to]
        tmp[to] = swap
        swaps += 1
    }
    return swaps
}


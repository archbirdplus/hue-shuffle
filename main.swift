
print("start...")

var boards: [[Tile]] = []
while boards.count < 100 {
    let new = initLevel()
    boards.append(new)
}

print("numbers represent intended position")
print("*tile is anchored")
print(boards.first!.enumerated().map { n, x in (n % 9 == 0 && n != 0 ? "\n" : "") + (x.fixed ? "*" : "") + String(x.correctPlace) }.joined(separator: "\t"))

let solutions = boards.map { $0.map { $0.correctPlace } } .map(minSwapCount)

let correct = 9*11-4-1 // sub 1 from the number of non-fixed tiles
if (!solutions.contains { $0 != correct }) {
    print("all correct!")
} else {
    print("scramble failed!")
}


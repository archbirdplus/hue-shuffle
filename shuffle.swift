// I Love Hue
// A puzzle of perception, not logic.
// But of too much luck-
//  the perfect solution ranges up to 2 times, out of control of the player.
// The shuffler shown here generates uniformly worst-case levels in O(n).

typealias Color = Void

struct Tile {
    let color: Color
    let correctPlace: Int
    let fixed: Bool

    init(_ color: Color, _ correctPlace: Int, _ fixed: Bool = false) {
        self.color = color
        self.correctPlace = correctPlace
        self.fixed = fixed
    }

    var toFixed: Self { Tile(color, correctPlace, true) }
}

func initGradient(w: Int = 9, h: Int = 11) -> [Tile] {
    var gradient = (0..<w*h).map { i in Tile(Color(), i, false) }
    for i in [0, w-1, w*(h-1), w*h-1] {
        gradient[i] = gradient[i].toFixed
    }
    return gradient
}

func scramble(_ level: [Tile]) -> [Tile] {
    let ring = level.filter { !$0.fixed }.shuffled()
    return ring.enumerated().reduce(into: level) { r, x in
        let (i, tile) = x
        r[ring[(i+1)%ring.count].correctPlace] = tile
    }
}

func initLevel() -> [Tile] { scramble(initGradient()) }


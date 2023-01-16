import Foundation

struct BlackjackCard {

    // nested Suit enumeration
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }

    // nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }

    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

// let aceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
// let kingOfHearts = BlackjackCard(rank: .king, suit: .hearts)
// let sixOfDiamonds = BlackjackCard(rank: .six, suit: .diamonds)

// print("The ace of spades : \(aceOfSpades.description)")
// print("The king of hearts : \(kingOfHearts.description)")
// print("The six of diamonds : \(sixOfDiamonds.description)")



let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
print(heartsSymbol)

import AppKit

class Card : NSObject {
	var color : Color
	var value : Value

	init (c: Color, v: Value)
	{
		color = c
		value = v
	}

	override var description : String {
		var output = "Card drawn: "
		output += String(describing: value)
		output += " of " + color.rawValue + "\n"
		return output
	}

	override func isEqual(_ object: Any?) -> Bool {
		if let object = object as? Card {
			return value == object.value && color == object.color
		} else {
			return false
		}
	}

	static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.color == rhs.color && lhs.value == rhs.value
    }
}

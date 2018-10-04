import AppKit

class Deck : NSObject {
 
	static var allSpades = Value.allValues.map {(number) -> Card in
	var output = Card(c: Color.Spade, v: number)
	return output
	}

	static var allClubs = Value.allValues.map {(number) -> Card in
	var output = Card(c: Color.Club, v: number)
	return output
	}

	static var allDiamonds = Value.allValues.map {(number) -> Card in
	var output = Card(c: Color.Diamond, v: number)
	return output
	}

	static var allHearts = Value.allValues.map {(number) -> Card in
	var output = Card(c: Color.Heart, v: number)
	return output
	}

	static var allCards = [allSpades, allClubs, allDiamonds, allHearts]
}

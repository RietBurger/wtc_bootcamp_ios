import Foundation

print("******* testing Card -> description *******")

var out = Card(c: Color.Diamond, v: Value.Ace)
var out1 = Card(c: Color.Diamond, v: Value.Ace)
var out2 = Card(c: Color.Diamond, v: Value.Queen)
var out3 = Card(c: Color.Club, v: Value.Ace)
var out4 = Card(c: Color.Spade, v: Value.Seven)

print(out.description)
print(out1.description)
print(out2.description)
print(out3.description)
print(out4.description)

print("******* testing Card -> isEqual override fund *******")

print("testing out against out1 - TRUE")
print(out.isEqual(out1))
print("testing out against out2 - FALSE")
print(out.isEqual(out2))


print("******* testing Card -> overload == *******")

print("testing out against out3 - FALSE")
print(out == out3)
print("testing out against out4 - FALSE")
print(out == out4)

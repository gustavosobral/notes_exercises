package main

func main() {
  cards := newDeck()

  hand, remainingDeck := deal(cards, 5)
  hand.print()
  remainingDeck.print()

  cards.saveToFile("my_cards")
  newDeckFromFile("my_cards").print()
  
  cards.shuffle()
  cards.print()
}

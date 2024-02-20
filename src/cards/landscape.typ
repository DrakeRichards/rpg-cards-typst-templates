// Imports
#import "/src/templates/common.typ": template as templateCommon
#import "/src/templates/character-landscape.typ": generateCharacterCard
#import "/src/templates/item-landscape.typ": generateItemCard

#let data = yaml("/in/data.yaml")
#for card in data.cards {
  if card.type == "character" {
    generateCharacterCard(card)
  }
  if card.type == "item" {
    generateItemCard(card)
  }
}
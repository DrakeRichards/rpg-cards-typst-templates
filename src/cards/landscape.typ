// Imports
#import "/src/templates/common.typ": template as templateCommon
#import "/src/templates/character-landscape.typ": generateCharacterCard
#import "/src/templates/item-landscape.typ": generateItemCard
#import "/src/modules/getCardData.typ": getCardData

#let data = yaml("/in/data.yaml")
#for card in data.cards {
  let cardData = getCardData(card)
  if card.type == "character" {
    generateCharacterCard(cardData)
  }
  if card.type == "item" {
    generateItemCard(cardData)
  }
}
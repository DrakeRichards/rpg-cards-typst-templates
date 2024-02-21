// Imports
#import "/src/templates/common.typ": template as templateCommon
#import "/src/templates/character-landscape.typ": generateCharacterCard
#import "/src/templates/item-landscape.typ": generateItemCard
#import "/src/modules/generateCardContentBlocks.typ": generateCardContentBlocks

#let data = yaml("/in/data.yaml")
#for card in data.cards {
  let cardContentBlocks = generateCardContentBlocks(card)
  if card.type == "character" {
    generateCharacterCard(cardContentBlocks)
  }
  if card.type == "item" {
    generateItemCard(cardContentBlocks)
  }
}
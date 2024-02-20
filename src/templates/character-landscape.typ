// Imports
#import "/src/modules/getCardData.typ": getCardData
#import "/src/templates/common.typ": template as templateCommon
#import "/src/modules/resizeContent.typ": sizedContent

#let generateCharacterCard(characterData) = {
  // Page settings
  set page(width: 6in, height: 4in, margin: 15pt)

  let cardData = getCardData(characterData)

  // Blocks for each half of the card
  let blocksLeft = {
    cardData.nameSubText
    cardData.bodyText
    cardData.lists
  }

  let blocksRight = {
    cardData.portrait
  }

  // Build the document.
  // Include global formatting rules
  show: templateCommon(bannerColor: color.maroon)[
    #cardData.name
    #grid(
      columns: (auto, 50%),
      rows: (87%),
      column-gutter: 3mm,
      sizedContent(blocksLeft),
      blocksRight,
    )
  ]
}

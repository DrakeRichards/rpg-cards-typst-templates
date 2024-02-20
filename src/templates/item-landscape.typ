// Imports
#import "/src/modules/getCardData.typ": getCardData
#import "/src/templates/common.typ": template as templateCommon
#import "/src/modules/resizeContent.typ": sizedContent

#let generateItemCard(itemData) = {
  // Page settings
  set page(width: 6in, height: 4in, margin: 15pt)

  let cardData = getCardData(itemData)

  // Blocks for each half of the card
  let blocksLeft = {
    cardData.portrait
  }

  let blocksRight = {
    cardData.nameSubText
    cardData.bodyText
    cardData.lists
  }

  // Build the document.
  // Include global formatting rules
  show: templateCommon(bannerColor: color.navy)[
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

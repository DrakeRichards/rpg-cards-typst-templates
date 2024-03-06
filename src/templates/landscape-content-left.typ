// Imports
#import "/src/templates/common.typ": template as templateCommon
#import "/src/modules/resizeContent.typ": sizedContent

#let generate(cardContent) = {
  // Page settings
  set page(width: 6in, height: 4in, margin: 15pt)

  // Blocks for each half of the card
  let blocksLeft = {
    cardContent.nameSubtext
    cardContent.bodyText
    cardContent.lists
  }

  let blocksRight = {
    cardContent.portrait
  }

  // Build the document.
  // Include global formatting rules
  show: templateCommon(bannerColor: cardContent.bannerColor)[
    #cardContent.name
    #grid(
      columns: (auto, 50%),
      rows: (87%),
      column-gutter: 3mm,
      sizedContent(blocksLeft),
      blocksRight,
    )
  ]
}

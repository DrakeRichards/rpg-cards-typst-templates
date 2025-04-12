// Imports
#import "/templates/common.typ": template as templateCommon
#import "/modules/resizeContent.typ": sizedContent

#let generate(cardContent) = {
  // Page settings
  set page(width: 6in, height: 4in, margin: 15pt)

  // Blocks for each half of the card
  let blocksLeft = {
    cardContent.portrait
  }

  let blocksRight = {
    cardContent.nameSubtext
    cardContent.bodyText
    cardContent.lists
  }

  // Build the document.
  // Include global formatting rules
  show: templateCommon(
    bannerColor: cardContent.bannerColor,
  )[
    #cardContent.name
    #grid(
      columns: (auto, 50%),
      rows: (87%),
      column-gutter: 3mm,
      blocksLeft,
      sizedContent(maxHeight: 3.0in, blocksRight), // SizedContent makes this a bit too big, so manually resize down to 3 inches.
    )
  ]
}

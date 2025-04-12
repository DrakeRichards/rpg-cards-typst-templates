// Imports
#import "/templates/common.typ": template as templateCommon
#import "/modules/resizeContent.typ": sizedContent

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
      column-gutter: 3mm,
      grid.cell(sizedContent(blocksLeft)),
      grid.cell(blocksRight),
    )
  ]
}

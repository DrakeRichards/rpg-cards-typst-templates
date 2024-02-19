// Imports
#import "/src/blocks/character.typ" as blocks
#import "/src/templates/common.typ": template as templateCommon
#import "/src/modules/resizeContent.typ": sizedContent

// Page settings
#set page(width: 6in, height: 4in, margin: 15pt)

// Blocks for each half of the card
#let blocksLeft = {
  blocks.subText
  blocks.bodyText
  blocks.lists
}

#let blocksRight = {
  blocks.portrait()
}

// Build the document.
// Include global formatting rules
#show: templateCommon(bannerColor: color.maroon)[
  #blocks.name
  #grid(
    columns: (auto, 50%),
    rows: (87%),
    column-gutter: 3mm,
    sizedContent(blocksLeft),
    blocksRight,
  )
]

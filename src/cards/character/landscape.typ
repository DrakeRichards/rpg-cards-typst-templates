// Imports
#import "/src/blocks/character.typ" as blocks
#import "/src/templates/character.typ": template
#import "/src/common/resizeContent.typ": sizedContent

// Include global formatting rules
#show: template

// Page settings
#set page(width: 6in, height: 4in, margin: 15pt, fill: white)

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
#blocks.name
#grid(
  columns: (auto, 50%),
  rows: (87%),
  column-gutter: 3mm,
  sizedContent(blocksLeft),
  blocksRight,
)

// Imports
#import "/src/blocks/character.typ" as blocks
#import "/src/templates/character.typ": template

// Include global formatting rules.
#show: template

// Page settings
#set page(width: 6in, height: 4in, margin: 15pt, fill: white)

// Build the document.
#blocks.name
#grid(columns: (auto, 50%), rows: (85%), column-gutter: 3mm, [
  #blocks.subText
  #line(length: 100%)
  #blocks.bodyText
  #line(length: 100%)
  #blocks.listTitle
  #blocks.listItems
  #blocks.footer
], [
  #blocks.portrait
  #blocks.imageSubtext
])

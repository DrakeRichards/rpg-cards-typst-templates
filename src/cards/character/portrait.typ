// Imports
#import "/src/blocks/character.typ" as blocks
#import "/src/cards/character/formatting.typ": template

// Include global formatting rules.
#show: template

// Page settings
#set page(width: 4in, height: 6in, margin: 15pt, fill: white)

// Build the document.
#blocks.name
#blocks.subText
#blocks.sizedPortrait(width: 100%)
#blocks.imageSubtext
#line(length: 100%)
#blocks.bodyText
#line(length: 100%)
#blocks.listTitle
#blocks.listItems
#blocks.footer

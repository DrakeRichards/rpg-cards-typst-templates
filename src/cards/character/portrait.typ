// Imports
#import "/src/blocks/character.typ" as blocks
#import "/src/templates/character.typ": template
#import "/src/common/resizeContent.typ": sizedContent

// Include global formatting rules.
#show: template

// Page settings
#set page(width: 5in, height: 7in, margin: 15pt, fill: white)

#let body = {
  blocks.bodyText
  blocks.lists
}

// Build the document.
#blocks.name
#blocks.subText
#blocks.portrait(width: 70%)
#block(width: 100%, height: 2in)[#sizedContent(body)]

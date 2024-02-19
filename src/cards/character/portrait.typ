// Imports
#import "/src/blocks/character.typ" as blocks
#import "/src/templates/common.typ": template
#import "/src/modules/resizeContent.typ": sizedContent

// Include global formatting rules.

// Page settings
#set page(width: 4in, height: 6in, margin: 15pt, fill: white)

#let body = {
  blocks.bodyText
  blocks.lists
}

// Build the document.
#show: template(bannerColor: color.maroon)[
  #blocks.name
  #blocks.subText
  #blocks.portrait(width: 70%)
  #block(width: 100%, height: 2in)[#sizedContent(body)]
]

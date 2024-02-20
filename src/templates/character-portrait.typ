// Imports
#import "/src/templates/common.typ": template as templateCommon
#import "/src/modules/resizeContent.typ": sizedContent

#let generateCharacterCard(cardContent) = {
  // Page settings
  set page(width: 4in, height: 6in, margin: 15pt)

  let body = {
    cardContent.bodyText
    cardContent.lists
  }

  // Build the document.
  // Include global formatting rules
  show: templateCommon(bannerColor: color.maroon)[
    #cardContent.name
    #cardContent.subText
    #cardContent.portrait
    #block(width: 100%, height: 2in)[
      #sizedContent(body)
    ]
  ]
}

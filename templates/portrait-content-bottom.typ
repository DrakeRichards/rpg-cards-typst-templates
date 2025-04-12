// Imports
#import "/templates/common.typ": template as templateCommon
#import "/modules/resizeContent.typ": sizedContent

#let generate(cardContent) = {
  // Page settings
  set page(width: 4in, height: 6in, margin: 15pt)

  let body = {
    cardContent.bodyText
    cardContent.lists
  }

  // Build the document.
  // Include global formatting rules
  show: templateCommon(bannerColor: cardContent.bannerColor)[
    #cardContent.name
    #cardContent.subText
    #cardContent.portrait
    #block(width: 100%, height: 2in)[
      #sizedContent(body)
    ]
  ]
}

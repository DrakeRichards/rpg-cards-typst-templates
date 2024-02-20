// Imports
#import "/src/modules/getCardData.typ": getCardData
#import "/src/templates/common.typ": template as templateCommon
#import "/src/modules/resizeContent.typ": sizedContent

#let generateCharacterCard(characterData) = {
  // Page settings
  set page(width: 4in, height: 6in, margin: 15pt)

  let cardData = getCardData(characterData)

  let body = {
    cardData.bodyText
    cardData.lists
  }

  // Build the document.
  // Include global formatting rules
  show: templateCommon(bannerColor: color.maroon)[
    #cardData.name
    #cardData.subText
    #cardData.portrait
    #block(width: 100%, height: 2in)[
      #sizedContent(body)
    ]
  ]
}

// Imports
#import "/src/modules/validation.typ"
#import "/src/modules/listWithKeys.typ": listWithKeys

#let _getNameContent(name) = heading(level: 1, name)

#let _getNameSubTextContent(nameSubText) = {
  set text(style: "italic")
  nameSubText
}

#let _getBodyTextContent(bodyText) = {
  set par(justify: true)
  linebreak()
  bodyText
}

#let _getImagePath(image) = {
  if validation.isUrl(image) {
    return image
  } else {
    return "/in/" + image
  }
}

#let _getPortraitContent(imagePath, imageSubtext) = {
  // Check whether the path to the image is a URL or a file.
  let imagePathParsed = _getImagePath(imagePath)

  // Show the image.
  set align(center)
  show figure.caption: it => {
    set text(style: "italic")
    it.body
  }
  figure(
    caption: imageSubtext,
    image(imagePathParsed, width: 100%, fit: "contain"),
  )
}

#let _getListsContent(lists) = {
  if type(lists) != "array" {
    return
  }
  for list in lists {
    linebreak()
    listWithKeys(title: list.title, headingLevel: 2, list.items)
  }
}

#let getCardData(data) = (
  name: { if data.keys().contains("name") { _getNameContent(data.name) } else { "" } },
  nameSubText: {
    if data.keys().contains("nameSubtext") { _getNameSubTextContent(data.nameSubtext) } else { "" }
  },
  bodyText: if data.keys().contains("bodyText") { _getBodyTextContent(data.bodyText) } else { "" },
  portrait: if data.keys().contains("image") {
    _getPortraitContent(
      data.image,
      { if data.keys().contains("imageSubtext") { data.imageSubtext } else { "" } },
    )
  } else { "" },
  lists: if data.keys().contains("lists") { _getListsContent(data.lists) } else { "" },
)
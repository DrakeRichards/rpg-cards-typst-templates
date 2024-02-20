// Imports
#import "/src/modules/validation.typ"
#import "/src/modules/listWithKeys.typ": listWithKeys

#let _getNameContent(data) = {
  if "name" not in data.keys() {
    return ""
  }
  heading(level: 1, data.name)
}

#let _getNameSubtextContent(data) = {
  if "nameSubtext" not in data.keys() {
    return ""
  }
  set text(style: "italic")
  data.nameSubtext
}

#let _getBodyTextContent(data) = {
  if "bodyText" not in data.keys() {
    return ""
  }
  set par(justify: true)
  linebreak()
  data.bodyText
}

#let _getImagePath(fileName) = {
  if validation.isUrl(fileName) {
    return fileName
  } else {
    return "/in/" + fileName
  }
}

#let _getPortraitContent(data) = {
  if "image" not in data.keys() {
    return ""
  }
  // Check whether the path to the image is a URL or a file.
  let imagePath = _getImagePath(data.image)

  // Set a blank caption if imageSubtext is missing.
  let imageSubtext = if "imageSubtext" in data.keys() {
    data.imageSubtext
  } else {
    ""
  }

  // Image is center-aligned and caption is italicized.
  set align(center)
  show figure.caption: it => {
    set text(style: "italic")
    it.body
  }

  // Return the figure
  figure(caption: imageSubtext, image(imagePath, width: 100%, fit: "contain"))
}

#let _getListsContent(data) = {
  if "lists" not in data.keys() {
    return
  }
  if type(data.lists) != "array" {
    return
  }
  for list in data.lists {
    linebreak()
    listWithKeys(title: list.title, headingLevel: 2, list.items)
  }
}

#let getCardData(data) = (
  name: _getNameContent(data),
  nameSubText: _getNameSubtextContent(data),
  bodyText: _getBodyTextContent(data),
  portrait: _getPortraitContent(data),
  lists: _getListsContent(data),
)
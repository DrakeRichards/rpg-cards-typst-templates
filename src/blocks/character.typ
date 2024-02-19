// Imports
#import "/src/common/validation.typ"
#import "/src/blocks/listWithKeys.typ": listWithKeys
#let data = yaml("/in/character.yaml")

// Name
#let name = heading(level: 1, data.name)

// Text under the name
#let subText = if data.keys().contains("nameSubtext") {
  set text(style: "italic")
  data.nameSubtext
}

// Body Text
#let bodyText = {
  set par(justify: true)
  linebreak()
  data.bodyText
}

// Character portrait
#let portrait(width: 100%) = {
  // Check whether the path to the image is a URL or a file.
  let imagePath = {
    if validation.isUrl(data.image) {
      data.image
    } else {
      "/in/" + data.image
    }
  }

  // Show the image.
  set align(center)
  show figure.caption: it => {
    set text(style: "italic")
    it.body
  }
  figure(
    caption: if data.keys().contains("imageSubtext") { data.imageSubtext },
    image(imagePath, width: width, fit: "contain"),
  )
}

// Bulleted Lists
#let lists = if data.keys().contains("lists") {
  if type(data.lists) != "array" {
    return
  }
  for list in data.lists {
    linebreak()
    listWithKeys(title: list.title, headingLevel: 2, list.items)
  }
}

// Footer
#let footer = if data.keys().contains("footerText") {
  set align(center + bottom)
  if data.keys().contains("footerText") {
    data.footerText
  }
}

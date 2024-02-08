// Imports
#import "/src/common/tests.typ"
#import "/src/blocks/listWithKeys.typ": listWithKeys
#let data = yaml("/in/character.yaml")

// Name
#let name = heading(level: 1, data.name)

// Body Text
#let bodyText = par(justify: true)[
  #line(length: 100%)
  #data.bodyText
]

// Image
#let imagePath = {
  if tests.isUrl(data.image) {
    data.image
  } else {
    "/in/" + data.image
  }
}

// Function to return a portrait of a given width
#let sizedPortrait(width: 100%) = {
  set align(center)
  figure(image(imagePath, width: width, fit: "contain"))
}

// Basic portrait block
#let portrait = {
  set align(center)
  show figure.caption: it => {
    set text(style: "italic")
    it.body
  }
  figure(
    caption: if data.keys().contains("imageSubtext") { data.imageSubtext },
    image(imagePath, width: 100%, fit: "contain"),
  )
}

// Text under the name
#let subText = if data.keys().contains("nameSubtext") {
  set text(style: "italic")
  data.nameSubtext
}

// Bulleted Lists
#let lists = if data.keys().contains("lists") {
  if type(data.lists) != "array" {
    return
  }
  for list in data.lists {
    line(length: 100%)
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

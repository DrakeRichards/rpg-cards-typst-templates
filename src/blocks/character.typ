// Imports
#import "/src/common/tests.typ"
#let data = yaml("/in/character.yaml")

// Name
#let name = [= #data.name]

// Body Text
#let bodyText = par(justify: true)[
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

#let sizedPortrait(width: 100%) = {
  set align(center)
  show figure.caption: it => {
    set text(style: "italic")
    it.body
  }
  figure(image(imagePath, width: width, fit: "contain"))
}

#let portrait = {
  set align(center)
  show figure.caption: it => {
    set text(style: "italic")
    it.body
  }
  figure(image(imagePath, width: 100%, fit: "contain"))
}

// Title
#let subText = if data.keys().contains("nameSubtext") {
  set text(style: "italic")
  data.nameSubtext
}

// Bulleted List
// Title
#let listTitle = if data.keys().contains("listTitle") {
  [== #data.listTitle]
}

// Items
#let listItems = if data.keys().contains("listItems") {
  if type(data.listItems) == "array" {
    for item in data.listItems {
      [- *#item.name:* #item.value]
    }
  }
}

// Image subtext
// I use this instead of a caption because I want it to line up on both columns.
#let imageSubtext = if data.keys().contains("imageSubtext") {
  set align(center + bottom)
  set text(style: "italic")
  data.imageSubtext
}

// Footer
#let footer = if data.keys().contains("footerText") {
  set align(center + bottom)
  if data.keys().contains("footerText") {
    data.footerText
  }
}
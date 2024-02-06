// Imports
#import "tests.typ"
#let data = yaml("in/character.yaml")

// Global settings
#set page(width: 6in, height: 4in, margin: 15pt, fill: white)
#set text(size: 9pt)

// Headings
#show heading: it => {
  smallcaps(it)
}

// Level 1 headings have a highlight.
#show heading.where(level: 1): it => [
  #set text(size: 1.5em, fill: white)
  #box(width: 100%, inset: 5pt, fill: color.maroon, it)
]

// Level 2 headings are centered with a line beneath.
#show heading.where(level: 2): it => [
  #set align(center)
  #set text(size: 1.2em)
  #it
  // Move the line up a bit.
  #pad(top: -8pt, line(length: 100%))
]

// Blocks
// Name
#let name = [= #data.name]

// Title
#let subText = {
  set text(style: "italic")
  data.nameSubtext
}

// Body Text
#let bodyText = par(justify: true)[
  #data.bodyText
]

// Bulleted List
// Title
#let listTitle = if data.listTitle != "" {
  [== #data.listTitle]
} else { "" }

// Items
#let listItems = if data.listItems != none {
  for item in data.listItems {
    [- *#item.name:* #item.value]
  }
} else { [] }

// Image
#let imagePath = {
  if tests.isUrl(data.image) {
    data.image
  } else {
    "in/" + data.image
  }
}
#let characterImage = image(imagePath, height: auto, fit: "contain")
#let portrait = {
  set align(center)
  show figure.caption: it => {
    set text(style: "italic")
    it.body
  }
  figure(characterImage)
}

// Image subtext
// I use this instead of a caption because I want it to line up on both columns.
#let imageSubtext = {
  set align(center + bottom)
  set text(style: "italic")
  data.imageSubtext
}

// Footer
#let footer = {
  set align(center + bottom)
  data.footerText
}

// Build the document.
#name
#grid(columns: (auto, 50%), rows: (85%), column-gutter: 3mm, [
  #subText
  #line(length: 100%)
  #bodyText
  #line(length: 100%)
  #listTitle
  #listItems
  #footer
], [
  #portrait
  #imageSubtext
])

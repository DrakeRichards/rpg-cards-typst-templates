// Formatting settings for character cards.

#let template(body) = {
  // Text
  set text(size: 9pt)

  // Headings
  show heading: it => {
    smallcaps(it)
  }

  // Level 1 headings have a highlight.
  show heading.where(level: 1): it => [
    #set text(size: 1.5em, fill: white)
    #box(width: 100%, inset: 5pt, fill: color.maroon, it)
  ]

  // Level 2 headings are centered
  show heading.where(level: 2): it => [
    #set align(center)
    #set text(size: 1.2em)
    #it
  ]

  // Lists
  set list(marker: [])

  // Linebreaks are a line
  show linebreak: it => {
    line(length: 100%)
  }

  body
}

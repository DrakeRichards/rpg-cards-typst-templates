// Formatting settings for character cards.
// PARAMETERS:
// - `bannerColor`: The color of the banner at the top of the card.
// - `content`: The content of the card.
#let template(bannerColor: color.gray, content) = {
  // Text
  // Sized for 4x6 index cards
  set text(size: 9pt)

  // Headings
  show heading: it => {
    smallcaps(it)
  }

  // Level 1 headings have a gray highlight.
  show heading.where(level: 1): it => [
    #set text(size: 1.5em, fill: white)
    #box(width: 100%, inset: 5pt, fill: bannerColor, it)
  ]

  // Level 2 headings are centered
  show heading.where(level: 2): it => {
    set align(center)
    set text(size: 1.2em)
    block(above: 0.5em, it)
  }

  // Remove list markers
  set list(marker: [])

  // Linebreaks are a line
  show linebreak: it => {
    line(length: 100%)
  }

  content
}

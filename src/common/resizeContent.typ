#import calc: sqrt

// Gets an em font size that should fit within a container of the target height.
// Parameters:
//  - `currentHeight: length`: The current height of the content to be resized.
//  - `targetHeight: length`: The target height of the container the content fits in.
// Returns:
//  - `<length>`: The new font size in em.
#let getNewRelativeFontSize(currentHeight, targetHeight) = {
  let newSize = sqrt((targetHeight / currentHeight)) * 1em
  return newSize
}

// Resizes some content to fit within a container, based on the height of the container.
// Parameters:
//  - `content: content`: The content to be sized.
//  - `(Optional) maxHeight: length`: The maximum height of the content. If left blank, will resize the content to fit within its parent container.
// Returns:
//  - `<content>`: The resized content.
// Example:
//  #let content1 = lorem(100)
//  #let content2 = lorem(200)
//  #let sizedContent1 = sizedContent(content1)
//  #let sizedContent2 = sizedContent(content2)
//  #let body = grid(columns: (1fr, 1fr), rows: 100%, column-gutter: 3pt)[#sizedContent1][#sizedContent2]
//  #body
#let sizedContent(content, maxHeight: 0pt) = layout(
  size => style(
    styles => {
      let contentHeight = measure(block(width: size.width, content), styles).height
      let blockHeight = size.height
      let targetHeight = maxHeight
      if maxHeight == 0pt {
        targetHeight = blockHeight
      } 
      if contentHeight > targetHeight {
        let newSize = getNewRelativeFontSize(contentHeight, targetHeight)
        set text(size: newSize)
        content
      } else {
        content
      }
    },
  ),
)

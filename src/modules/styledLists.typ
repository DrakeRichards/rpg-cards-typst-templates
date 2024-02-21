// Some lists may have a mixture of items with and without name labels. These functions generate lists with bolded labels in different styles.
// It also adds a heading to the list with a level based on the `headingLevel` parameter.

#let _listItem(name, value) = {
  if name == "" {
    return value
  }
  return [*#name:* #value]
}

// A plain unordered list
#let plainList(title: "", headingLevel: 2, items) = {
  if title != "" {
    heading(level: headingLevel, title)
  }
  let listItems = items.map(item => (_listItem(item.name, item.value)))
  list(..listItems)
}

// Actually a table with two columns, where the first column is right-aligned and the second column is left-aligned
#let alignedList(title: "", headingLevel: 2, items) = {
  if title != "" {
    heading(level: headingLevel, title)
  }
  let flattenedItems = ()
  for (name, value) in items {
    let leftText = if name != "" { [#str(name):] } else { "" }
    let leftContent = align(right, text(weight: "bold", leftText))
    let rightContent = align(left, text(str(value)))
    flattenedItems.push(leftContent)
    flattenedItems.push(rightContent)
  }
  table(
    columns: 2,
    inset: 0.4em,
    fill: (_, row) => if calc.odd(row) { luma(220) } else { none },
    stroke: none,
    ..flattenedItems,
  )
}

// Helper function to choose between list styles
#let styledList(style: "plain", title: "", headingLevel: 2, items) = {
  let listOptions = (
    plain: plainList(title: title, headingLevel: headingLevel, items),
    aligned: alignedList(title: title, headingLevel: headingLevel, items),
  )
  return listOptions.at(style)
}
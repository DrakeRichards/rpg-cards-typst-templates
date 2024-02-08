// Some lists may have a mixture of items with and without name labels. This generates a bulleted list with bolded names for items with names.
// It also adds a heading to the list with a level based on the `headingLevel` parameter.

#let listItem(name, value) = {
  if name == "" {
    return value
  }
  return [*#name:* #value]
}

#let listWithKeys(title: "", headingLevel: 2, items) = {
  if title != "" {
    heading(level: headingLevel, title)
  }
  let listItems = items.map(item => (listItem(item.name, item.value)))
  list(..listItems)
}

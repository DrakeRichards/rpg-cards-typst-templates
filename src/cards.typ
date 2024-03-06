// Imports
#import "/src/templates/common.typ": template as templateCommon
#import "/src/modules/generateCardContentBlocks.typ": generateCardContentBlocks

#let data = yaml("/in/data.yaml")
#for card in data.cards {
  let cardContentBlocks = generateCardContentBlocks(card)
  // Import the template defined in the 'template' field.
  // There's no way to check whether the file exists, so we assume it does.
  let importPath = "/src/templates/" + card.template + ".typ"
  import importPath as template
  template.generate(cardContentBlocks)
}
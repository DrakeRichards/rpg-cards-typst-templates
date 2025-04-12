// Imports
#import "/src/templates/common.typ": template as templateCommon
#import "/src/modules/generateCardContentBlocks.typ": generateCardContentBlocks

#let data = {
  let inputFile = "../examples/data.yaml"
  if "data" in sys.inputs.keys() {
    inputFile = sys.inputs.at("data")
  }
  let fileExtension = inputFile.split(".").last()
  if fileExtension == "json" {
    json(inputFile)
  }
  if fileExtension == "yaml" {
    yaml(inputFile)
  }
  if fileExtension == "yml" {
    yaml(inputFile)
  }
  if fileExtension == "toml" {
    toml(inputFile)
  }
  if fileExtension == "xml" {
    xml(inputFile)
  }
}

#for card in data.cards {
  let cardContentBlocks = generateCardContentBlocks(card)
  // Import the template defined in the 'template' field.
  // There's no way to check whether the file exists, so we assume it does.
  let importPath = "/src/templates/" + card.template + ".typ"
  import importPath as template
  template.generate(cardContentBlocks)
}
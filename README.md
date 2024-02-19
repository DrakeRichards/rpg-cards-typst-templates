# Typst RPG Cards

System-agnostic Typst templates for various RPG cards. Currently has templates for:

- Characters / NPCs

## Usage

### Installation

1. Install Typst.
1. Clone this repository.
1. Navigate to the repository's root directory.

### Examples

1. Copy the files in the `examples` directory to the `in` directory.
1. Follow the instructions in the "Generating" section below.

### Create Your Own Cards

1. Create a new `yaml` file in the `in` directory for the card type you want to generate.
    - Character: `in/character.yaml`
1. Use the appropriate JSON schema in the `schemas` directory to help you create the `yaml` file.
    - Character: `schemas/character.schema.json`

### Generating

1. Run one of the following commands depending on the type of card you want to generate:
    - Character, landscape: `typst compile src/cards/character/landscape.typ out/character-landscape.pdf --root ./`
    - Character, portrait: `typst compile src/cards/character/portrait.typ out/character-portrait.pdf --root ./`
1. Output will be in the `out` directory.

## Customization

The templates provided are very basic and meant to be system-agnostic. That means no specific stats or fields are included. You can customize the templates to include whatever fields/blocks you want.

### Modules

I've included a few modules to help with common issues I encountered:

- `src/modules/listWithKeys.typ`: Used to generate an unordered list with a mix of items that have keys and items that don't. Keys are **bolded** and have a colon after them.
- `src/modules/resizeContent.typ`: Resizes content to fit within a given height. Useful for ensuring content doesn't overflow the card. Not very accurate, but good enough for most cases.
- `src/modules/validation.typ`: A collection of functions to validate various things. Currently only has a function to validate that a string is a valid URL.

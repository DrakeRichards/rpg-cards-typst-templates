"""
Python classes used to represent the data structure for a card in a Typst template.
Also used to generate a JSON schema for validation.
"""

from dataclasses import dataclass, field
from typing import List
from mashumaro.jsonschema import build_json_schema


@dataclass
class ListItem:
    """
    A single item in a list to be used in the Typst template.

    Attributes:
        name (str): The name of the item. Can be blank if you don't want the item labelled.
        value (str): The value of the item.
    """

    name: str = field(
        default_factory=str,
        metadata={
            "description": "The name of the item. Can be blank if you don't want the item labelled."
        },
    )
    value: str = field(
        default_factory=str, metadata={"description": "The value of the item."}
    )


@dataclass
class ListProperties:
    """
    Lists to be used in the Typst template.
    Lists are non-paragraphical elements that are used to display information in a structured manner.

    Attributes:
        title (str): The title of the bulleted list. Can be left blank.
        style (str): The style of the list. Defaults to 'plain'.
        items (List[ListItem]): The list of items that will appear on the card. This is where you can put the character's stats, abilities, or other details.
    """

    title: str = field(
        default_factory=str,
        metadata={"description": "The title of the bulleted list. Can be left blank."},
    )
    style: str = field(
        default="plain",
        metadata={
            "description": "The style of the list. Defaults to 'plain'.",
            "enum": ["plain", "aligned"],
            "default": "plain",
        },
    )
    items: List[ListItem] = field(
        default_factory=list,
        metadata={
            "description": "The list of items that will appear on the card. This is where you can put the character's stats, abilities, or other details."
        },
    )


@dataclass
class CardData:
    """
    Layout data for a card to be used in the Typst template.

    Attributes:
        template (str): The name of the template file to use.
        banner_color (str): The color of the top banner. Must be an RGB hex code.
        name (str): The name of the subject which will appear on the top banner.
        name_subtext (str): The text that will appear beneath the name.
        body_text (str): The body text that will fill the bulk of the card.
        image (str): The URL or filename of the image to be used as the card's portrait.
        image_subtext (str): The subtext that will appear beneath the image.
        lists (List[ListProperties]): An array of lists.
    """

    template: str = field(
        default_factory=str,
        metadata={"description": "The name of the template file to use."},
    )
    banner_color: str = field(
        default="#000000",
        metadata={
            "description": "The color of the top banner. Must be an RGB hex code.",
            "default": "#000000",
            "pattern": "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$",
        },
    )
    name: str = field(
        default_factory=str,
        metadata={
            "description": "The name of the subject which will appear on the top banner."
        },
    )
    name_subtext: str = field(
        default_factory=str,
        metadata={"description": "The text that will appear beneath the name."},
    )
    body_text: str = field(
        default_factory=str,
        metadata={"description": "The body text that will fill the bulk of the card."},
    )
    image: str = field(
        default_factory=str,
        metadata={
            "description": "The URL or filename of the image to be used as the card's portrait."
        },
    )
    image_subtext: str = field(
        default_factory=str,
        metadata={"description": "The subtext that will appear beneath the image."},
    )
    lists: List[ListProperties] = field(
        default_factory=list,
        metadata={
            "description": "An array of lists.",
        },
    )

    def __post_init__(self):
        # Ensure that the banner color is a valid hex code
        if not self.banner_color.startswith("#") or len(self.banner_color) != 7:
            raise ValueError(
                "Banner color must be a valid RGB hex code (e.g., #RRGGBB)."
            )


@dataclass
class CardCollection:
    """
    A list of cards to use in the Typst template.

    Attributes:
        cards (List[CardData]): An array of cards.
    """

    cards: List[CardData] = field(
        default_factory=list,
        metadata={
            "description": "An array of cards.",
        },
    )


def to_jsonschema():
    """
    Convert the dataclass to JSON schema.
    """

    schema = build_json_schema(CardCollection, all_refs=True).to_json()

    # Write the schema to a file
    with open("data.schema.json", "w") as f:
        f.write(schema)

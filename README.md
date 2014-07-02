billfold
========

NOT MVP:
As a user, I can...
- take a photo of a bill/receipt
- have that bill parsed by item
- create contacts to split the bill with
- select contacts from your contact book to split the bill with
- move through the bill, assigning each item to a person
- move through the bill, allocating a portion of each item to people to share
- verify that each item on the bill has been covered
- send a paypal request to a person for their share
- track my own expenses and running totals

MVP:
- restaurant bills only

1/ Enter the diners
  - stretch: add from contacts
2/ Take a pic of the receipt 
3/ Divvy it up
  - Click on an item
  - Select appropriate person
  - Selecting multiple people splits evenly
  - stretch: update split percentages
  - stretch: paypal request

  Dependencies:
  - if we use paypal, we need user authentication

MILESTONES:
- get it on a phone by Friday at 2 pm

THINGS WE NEED TO LEARN:
- Swift
- OCR: Tessaract (the image/word parser)

THINGS OF NOTE:
- Memory Lane code:
  - http://github.com/sassygrody/memory_lane_swift
- Kevin Swift Solorio
- Might be cool to add some Twilio
- 




RESOURCES:
[tessaract](https://github.com/ldiqual/tesseract-ios)
[KSolo's Timeline](https://github.com/fireflies-2014/phase-3-guide/blob/reorganize/resources/final-projects.md)

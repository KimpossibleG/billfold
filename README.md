billfold
========


## RESOURCES:
- [tessaract](https://github.com/ldiqual/tesseract-ios)
- [KSolo's Timeline](https://github.com/fireflies-2014/phase-3-guide/blob/reorganize/resources/final-projects.md)
- [Our Schedule](https://github.com/KimpossibleG/billfold/blob/master/schedule)

## Pickles-Approved Git Process

### To start working on the app:
1. git clone "the master"
2. git checkout -b "your_branch_name"
3. git pull origin master

### To submit a pull request:
1. git checkout {your_branch_name}
2. git add/commit your changes
3. git pull origin master (will try to merge; fix conflicts if necessary)
4. git add/commit any changes
5. git push origin {your_branch_name}
6. On GitHub, submit a pull request


## MVP:
NB: * indicates stretch

- restaurant bills only

1. Enter the diners
  add from contacts*
2. Take a pic of the receipt 
3. Divvy it up
  Click on an item
  Select appropriate person
Selecting multiple people splits evenly
update split percentages*
paypal request*

### Dependencies:
  - if we use paypal, we need user authentication

## MILESTONES:
- get it on a phone by Friday at 2 pm

## THINGS WE NEED TO LEARN:
- Swift
- OCR: Tessaract (the image/word parser)

## THINGS OF NOTE:
- Memory Lane code:
  - http://github.com/sassygrody/memory_lane_swift
- Kevin Swift Solorio
- Might be cool to add some Twilio
 

## NOT MVP:
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



BillFold
========

## Overview

BillFold is a stand-alone iPhone app that facilitates splitting restaurant bills amongst multiple diners. BillFold uses optical character recognition to parse a photo of the bill, and then allows the user to verify prices, select diners, assign food items (and shared food items) to each diner, and outputs a summary of what each diner owes.

## Using BillFold

BillFold is available for the iPhone 4/4s/5/5s, and requires iOS 8. During development, BillFold is only available for deployment to an iPhone by users with an Apple Developer license, available [here](https://developer.apple.com/programs/ios/). Users with a Mac OS X of 10.9.4 or higher can clone the app from this repo to their machines, and can use xCode 6 Beta to build and run the app with the iOS simulator. 

No additional software is required.

## Technologies

BillFold 
- Tesseract
- xCode 6 Beta
- Swift
- Objective C


## RESOURCES:
- [tessaract](https://github.com/ldiqual/tesseract-ios)
- [KSolo's Timeline](https://github.com/fireflies-2014/phase-3-guide/blob/reorganize/resources/final-projects.md)
- [Our Schedule](https://github.com/KimpossibleG/billfold/blob/master/schedule)


## Our Regex So Far
/(^.+)((\d+|\$)(\.|\s)\d\d($|\s))/

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
a. add from contacts*
2. Take a pic of the receipt    
3. Divvy it up   
a. Click on a person   
b. Select appropriate items from list for that person   
c. Pass it on   
- If multiple people select an item, it gets split evenly between them   
- Taxes are allocated proportionately based on individual bill totals   
d. Confirm that all items have been selected
e. update split percentages*   
f. paypal request*   

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



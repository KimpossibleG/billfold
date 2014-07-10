BillFold
========

## Overview

BillFold is a stand-alone iPhone app that facilitates splitting restaurant bills amongst multiple diners. BillFold uses optical character recognition to parse a photo of the bill, and then allows the user to verify prices, select diners, assign food items (and shared food items) to each diner, and outputs a summary of what each diner owes.

## Using BillFold

BillFold is available for the iPhone 5/5s, and requires iOS 8. During development, BillFold is only available for deployment to an iPhone by users with an Apple Developer license, available [here](https://developer.apple.com/programs/ios/). Detailed instructions for deploying a phone can be found [here](http://mobiforge.com/design-development/deploying-iphone-apps-real-devices).

Users with a Mac OS X 10.9.4 or higher can clone this repo to their machines, and can use xCode 6 Beta to build and run the app with the iOS simulator. 

No additional software is required.

## Technologies

- [Swift](https://developer.apple.com/swift/): Primary development language for BillFold
- [Objective C](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html): Secondary development language, used primarily for interacting with Tesseract
- [Tesseract](https://code.google.com/p/tesseract-ocr/), with [Leptonica](http://leptonica.com/): Optical Character Recognition library incorporated into BillFold
- [xCode 6 Beta](https://developer.apple.com/xcode/): Development toolset, including text editor, storyboard, and simulator

Note: The GitHub content statistics for BillFold are misleading, as they indicate 95% of BillFold's code is in C and/or C++. While that is accurate, it is because the Tesseract library is in C, and the Leptonica library is in C++. The bulk of BillFold's actual development content is Swift, followed by Objective C.

## Contributing

The BillFold team comprises [Rick Dsida](mailto:rick.dsida@icloud.com), [Kim Girard](mailto:kimberley.girard@gmail.com), [Mikee Pourhadi](mailto:mikeepourhadi@gmail.com), and [Caleb Rugg](mailto:calebrugg@gmail.com). If you have questions about the app or would like to contribute, please open an issue and/or submit a pull request to this respository using the below process:

### To start or continue working on the app:
1. `git clone https://github.com/KimpossibleG/billfold.git`
2. `git checkout -b your_branch_name`
3. `git pull origin master`

### To submit a pull request:
1. `git checkout your_branch_name`
2. `git add . `
3. `git commit -m "indicate your changes here"`
4. `git pull origin master` (will try to merge; fix conflicts if necessary)
5. `git add . `
6. `git commit -m "indicate your changes here"`
7. `git push origin your_branch_name`
8. On the [GitHub repo](https://github.com/KimpossibleG/billfold), submit a pull request.

## Licensing

This code is free to use under the terms of the MIT license.

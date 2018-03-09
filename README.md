# Twitter-Login
Implementation of Twitter SDK (Example)
## Getting Started
### Installation or Setup
1. Just download the repo or clone the repo
2. Open Terminal and go inside the folder,e.g cd [path to inside the repo folder]
3. Type pod install
4. Go to the folder,Just open the .xcworkspace 
5. Open Info.plist from project navigator 
6. Change the url type with your own url scheme(Please follow the link: https://github.com/twitter/twitter-kit-ios/wiki/Installation)

``` swift
  <key>CFBundleURLTypes</key>
  <array>
   <dict>
      <key>CFBundleURLSchemes</key>
      <array>
      <string>twitterkit-<consumerKey></string>
      </array>
   </dict>
  </array>
```
7. Open Appdelegate.swift,replace these things
``` swift
  TWTRTwitter.sharedInstance().start(withConsumerKey:"your consumer key", consumerSecret:"your secret key")
```
8. Run the project

### Basic Usage
 All the lines of code are properly commented if any issues free feel to open a issue will solve it
 
## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* https://github.com/twitter/twitter-kit-ios/wiki/Installation
* https://github.com/twitter/twitter-kit-ios

### Happy Coding

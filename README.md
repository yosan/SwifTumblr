# SwifTumblr

[![CI Status](http://img.shields.io/travis/yosan/SwifTumblr.svg?style=flat)](https://travis-ci.org/yosan/SwifTumblr)
[![Version](https://img.shields.io/cocoapods/v/SwifTumblr.svg?style=flat)](http://cocoapods.org/pods/SwifTumblr)
[![License](https://img.shields.io/cocoapods/l/SwifTumblr.svg?style=flat)](http://cocoapods.org/pods/SwifTumblr)
[![Platform](https://img.shields.io/cocoapods/p/SwifTumblr.svg?style=flat)](http://cocoapods.org/pods/SwifTumblr)

Simple Tumblr RSS parser by Swift.

```swift
SwifTumblr.getBlog(
    URLString: "http://ysn-blog.tumblr.com/api/read",
    success: { blog in
        self.blog = blog
        self.tableView.reloadData()
    },
    failure: { error in
        self.error = error
    }
)
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 9.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

SwifTumblr is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwifTumblr"
```

## UML

class Blog <<struct>> {
  +name: String?
  +timezone: String?
  +title: String?
  +description: String?
  +posts: Posts?
}

class Posts <<struct>> {
  +start: Int
  +total: Int
  -posts: [PostProtocol]?
}

interface PostProtocol {
  +id: String?
  +url: URL?
}

class PostRegular <<struct>> {
 +id: String?
 +url: URL?
}

class PostPhoto <<struct>> {
 +id: String?
 +url: URL?
}

Blog *- Posts
Posts o- PostProtocol
PostRegular .> PostProtocol
PostPhoto .> PostProtocol

@enduml

## Author

yosan, taka.yosuke@gmail.com

## License

SwifTumblr is available under the MIT license. See the LICENSE file for more info.

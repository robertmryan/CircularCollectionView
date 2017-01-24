## Swift `UICollectionView` with circle of cells

This is an demonstration of using custom `UICollectionViewLayout` to lay out a series of cells in a circle in Swift.

See WWDC 2012 video [Advanced Collection Views and Building Custom Layouts](https://developer.apple.com/videos/play/wwdc2012/219/), which shows an example of precisely this, using a custom circular layout (about 40+ minutes into the video). That was written in Objective-C. This is a Swift 3 implementation.

But the basic idea is to create a custom `UICollectionViewLayout` that implements:

- `collectionViewContentSize`;
- `layoutAttributesForItem(at indexPath:)`; and
- `layoutAttributesForElements(in rect:)`.

I created a `@IBDesignable` view for the circular view, but that is not critical to the question at hand, namely custom `UICollectionViewLayout` to lay out a series of cells in a circle.

This is not intended as an end-user library, but this is for illustrative purposes only.

See http://stackoverflow.com/a/41839446/1271826.

Developed in Swift 3 on Xcode 8.2.1 for iOS 10. But, the basic ideas are equally applicable for different versions of Swift and/or Objective-C. 

## License

Copyright &copy; 2017 Robert Ryan. All rights reserved.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

--

24 January 2017

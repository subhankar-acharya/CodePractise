//
//  GFAvatarImageViewCacheTests.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 9/30/25.
//
//

import XCTest
import UIKit
@testable import GHFollowers

final class GFAvatarImageViewCacheTests: XCTestCase {

    private func makeTestImage(color: UIColor = .red, size: CGSize = CGSize(width: 2, height: 2)) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer { UIGraphicsEndImageContext() }
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }

    func test_UsesCachedImage_WithoutNetwork() {
        let urlString = "https://example.com/avatar.png"
        let image = makeTestImage()
        // Prime cache with known image
        let key = NSString(string: urlString)
        cache.setObject(image, forKey: key)

        let imageView = UIImageView()
        imageView.downloadImage(from: urlString)

        // Cached path is synchronous; assert immediately
        XCTAssertNotNil(imageView.image)
        // Compare by PNG data to be robust across UIImage instances
        XCTAssertEqual(imageView.image?.pngData(), image.pngData())
    }
}


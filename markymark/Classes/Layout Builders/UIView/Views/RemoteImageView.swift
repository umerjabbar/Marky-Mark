//
//  Created by Jim van Zummeren on 08/05/16.
//  Copyright © 2016 M2mobi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

/*
 * Image view that can retrieve images from a remote http location
 */

open class RemoteImageView: UIImageView {

    public let file: String
    public let altText: String

    public init(file: String, altText: String) {
        self.file = file
        self.altText = altText

        super.init(frame: CGRect.zero)

        contentMode = .scaleAspectFit
        layer.cornerRadius = 6
        clipsToBounds = true
        if let image = UIImage(named: file) {
            self.image = image
            self.addAspectConstraint()
        } else if let url = URL(string: file) {
            loadImageFromURL(url.addHTTPSIfSchemeIsMissing())
        } else {
            print("Should display alt text instead: \(altText)")
        }
    }

    // MARK: Private

    private func loadImageFromURL(_ url: URL) {
        kf.setImage(with: url) { result in
            switch result {
            case .success(let imageResult):
//                self.image = image
                DispatchQueue.main.async(execute: {
//                    if let data = data, let image = UIImage(data: data) {
//                        self.image = image
                        self.addAspectConstraint()
                        NotificationCenter.default.post(name: NSNotification.Name.init("RemoteImageSizeUpdated"), object: nil)
//                    }
                })
            case .failure(let error):
                print(error.errorDescription ?? "error")
                break
            }
        }

//        DispatchQueue.global(qos: .default).async {
//
//            let data = try? Data(contentsOf: url)
//
//            DispatchQueue.main.async(execute: {
//                if let data = data, let image = UIImage(data: data) {
//                    self.image = image
//                    self.addAspectConstraint()
//                    NotificationCenter.default.post(name: NSNotification.Name.init("RemoteImageSizeUpdated"), object: nil)
//                }
//            })
//        }
    }

    private func addAspectConstraint() {
        if let image = image {
            let constraint = NSLayoutConstraint(
                item: self,
                attribute: .height,
                relatedBy: .equal,
                toItem: self,
                attribute: .width,
                multiplier: image.size.height / image.size.width,
                constant: 0
            )

            self.addConstraint(constraint)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

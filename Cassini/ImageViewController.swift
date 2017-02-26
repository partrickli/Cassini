//
//  ImageViewController.swift
//  Cassini
//
//  Created by liguiyan on 2017/2/25.
//  Copyright © 2017年 partrick. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var imageURL: URL? {
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage() {
        do {
            if let url = imageURL {
                let imageData = try Data(contentsOf: url)
                image = UIImage(data: imageData)
            }
        } catch {
            print("some error happen when fetch image from Internet")
        }
    }

    var image: UIImage? {
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            
        }
        get {
            return imageView.image
        }
    }
    
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        if let cassini = internetURLs["cassini"] {
            imageURL = URL(string: cassini)
        }
    }

}

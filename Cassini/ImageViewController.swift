//
//  ImageViewController.swift
//  Cassini
//
//  Created by liguiyan on 2017/2/25.
//  Copyright © 2017年 partrick. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    private let imageView = UIImageView()

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
        }
    }
    
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
        } catch let e {
            print("some error happen when fetch image from Internet \(e)")
        }
    }

    var image: UIImage? {
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            
        }
        get {
            return imageView.image
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        if let cassini = internetURLs["cassini"] {
            imageURL = URL(string: cassini)
        }
    }

}

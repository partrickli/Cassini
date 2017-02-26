//
//  CassiniViewController.swift
//  Cassini
//
//  Created by liguiyan on 2017/2/26.
//  Copyright © 2017年 partrick. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    private enum StoryboardSegue: String {
        case showImage
    }

    @IBAction func showImage(_ sender: UIButton) {
        performSegue(withIdentifier: StoryboardSegue.showImage.rawValue, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let button = sender as? UIButton else {
            print("segue is not initiated from UIButton")
            return
        }
        guard let ivc = segue.destination as? ImageViewController else {
            print("destination is not ImageViewController")
            return
        }
        ivc.imageURL = URL(string: internetURLs[button.currentTitle ?? ""] ?? "")
        
    }

}

//
//  ViewController.swift
//  GWHighlightView
//
//  Created by Will on 9/9/19.
//  Copyright © 2019 Ge Will. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - properties

    @IBOutlet var highlightView: GWHighlightView!
    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var iv: UIImageView!

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        highlightView.addTarget(self, action: #selector(highlightViewTapped(_:)), for: UIControl.Event.touchUpInside)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        highlightView.highlightableSubviews = [label, iv]
    }

    // MARK: - response methods

    @objc func highlightViewTapped(_ sender: GWHighlightView) {
        print("highlightViewTapped")
    }

    @objc func buttonTapped(_ sender: GWHighlightView) {
        print("buttonTapped")
    }

    @IBAction func imageClick(_ sender: UITapGestureRecognizer) {
        print("imageClick")
    }
}

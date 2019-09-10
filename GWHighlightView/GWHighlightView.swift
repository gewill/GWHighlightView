//
//  GWHighlightView.swift
//  GWHighlightView
//
//  Created by Will on 9/9/19.
//  Copyright © 2019 Ge Will. All rights reserved.
//

import UIKit

@IBDesignable class GWHighlightView: UIControl {
    // MARK: - properties

    /// 高亮背景色
    @IBInspectable var highlightBackgroundColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) {
        didSet {
            updateUI()
        }
    }

    /// 正常背景色
    @IBInspectable var normalBackgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet {
            updateUI()
        }
    }

    /// 覆写是非高亮
    override var isHighlighted: Bool {
        didSet {
            updateUI()
        }
    }

    // MARK: - life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
    }

    fileprivate func setupUI() {
    }

    fileprivate func updateUI() {
        layer.backgroundColor = isHighlighted ? highlightBackgroundColor.cgColor : normalBackgroundColor.cgColor
    }

    // MARK: - Tracking Touches andupdate Redrawing Controls

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        isHighlighted = true
        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)

        if bounds.contains(location) {
            isHighlighted = true
            return true
        } else {
            isHighlighted = false
            return false
        }
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        isHighlighted = false
        sendActions(for: .touchUpInside)
    }

    override func cancelTracking(with event: UIEvent?) {
    }
}

//
//  UIView+Extension.swift
//  NoteAppCoreData
//
//  Created by Ada on 8/13/21.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

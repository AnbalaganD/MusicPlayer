//
//  UIViewExtension.swift
//  MusicPlayer
//
//  Created by anbalagan-8641 on 23/08/23.
//

import UIKit

extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }
}

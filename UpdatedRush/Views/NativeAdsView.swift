//
//  NativeAdsView.swift
//  UpdatedRush
//
//  Created by EgorErmin on 17.02.2021.
//

import SwiftUI
import UIKit
import YandexMobileAds

final class AdVc: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

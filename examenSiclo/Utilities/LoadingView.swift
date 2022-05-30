//
//  LoadingView.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 22/05/22.
//

import Foundation
import UIKit
import Lottie

class LoadingView {
    static let shared = LoadingView()
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var animateView = AnimationView()
    
    func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        loadingView.center = uiView.center
        loadingView.backgroundColor = .white
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        animateView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        animateView.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        let av = Animation.named("waitingloading")
        self.animateView.animation = av
        self.animateView.contentMode = .scaleAspectFit
        self.animateView.loopMode = .loop
        self.animateView.play()
        
        loadingView.addSubview(animateView)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        
    }
    
    func hideActivityIndicator(uiView: UIView) {
//        self.animateView.stop()
        container.removeFromSuperview()
    }
}



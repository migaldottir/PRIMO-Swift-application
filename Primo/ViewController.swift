//
//  ViewController.swift
//  Primo
//
//  Created by migaldottir on 16/09/2022.
//

import UIKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .cyan
        return imageView
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBrown
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    let colours: [UIColor] = [
        .systemPink,
        .white,
        .systemMint,
        .systemTeal,
        .systemOrange
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
             
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton),
                         for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        
        view.backgroundColor = colours.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height-160-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-40,
                              height: 55)    }
    
    func getRandomPhoto() {
        let urlString =
            "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage (data: data)
    }
}





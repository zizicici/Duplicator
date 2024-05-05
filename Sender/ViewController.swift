//
//  ViewController.swift
//  Sender
//
//  Created by zici on 5/5/24.
//

import UIKit

class ViewController: UIViewController {
    private var indexButton: UIButton = {
        var configuration = UIButton.Configuration.tinted()
        configuration.title = "Sharing"
        
        let button = UIButton(configuration: configuration)
        button.tintColor = .systemRed
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(indexButton)
        indexButton.frame = CGRect(x: view.frame.width / 2 - 50, y: 100, width: 100, height: 48)
        
        indexButton.addTarget(self, action: #selector(sharing(_:)), for: .touchUpInside)
    }
    
    @objc
    func sharing(_ sender: UIButton) {
        guard let path = Bundle.main.path(forResource: "ggml-medium", ofType: "bin") else {
            print("File not found")
            return
        }
        let url = URL(fileURLWithPath: path)

        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)

        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }

        self.present(activityViewController, animated: true, completion: nil)
    }
}


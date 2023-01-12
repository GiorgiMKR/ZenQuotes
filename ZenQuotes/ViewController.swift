//
//  ViewController.swift
//  ZenQuotes
//
//  Created by macbook on 10/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    var apiManager: ApiManager = ApiManager()
    let url = "https://zenquotes.io/api/random"

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteLabel.adjustsFontSizeToFitWidth = true
        
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        
        apiManager.performRequest(url: url, completion: didUpdateInfo(info:))
        
    }
    
    func didUpdateInfo(info: ApiData) {
        print(info.a)
        print(info.q)
        self.quoteLabel?.text = info.q
        self.authorLabel?.text = info.a
        }
    }
    



//
//  ModalViewController.swift
//  Flixster
//
//  Created by Samuel Elbaz on 2/7/20.
//  Copyright © 2020 Samuel Elbaz. All rights reserved.
//

import UIKit
import WebKit

class ModalViewController: UIViewController, WKUIDelegate{
    
    var webView: WKWebView!
    var movieID: Int?
    var movieVideos = [[String:Any]]()
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\( movieID!)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
           let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
           let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
           let task = session.dataTask(with: request) { (data, response, error) in
              // This will run when the network request returns
              if let error = error {
                 print(error.localizedDescription)
              } else if let data = data {
                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.movieVideos = dataDictionary["results"] as! [[String:Any]]
                let trailerSelection = self.movieVideos[0]
                let youtubeKey = trailerSelection["key"] as! String
                let myURL = URL(string: "https://www.youtube.com/watch?v=\(youtubeKey)")
                let myRequest = URLRequest(url:myURL!)
                self.webView.load(myRequest)
                
            }
            
        }
        task.resume()
    
        

        // Do any additional setup after loading the view.

    }
    
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

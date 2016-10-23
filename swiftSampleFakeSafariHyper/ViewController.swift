//
//  ViewController.swift
//  swiftSampleFakeSafariHyper
//
//  Created by Eriko Ichinohe on 2016/02/02.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit
import Social


class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var btnTweet: UIButton!
    
    
    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //ユーザデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データを読みだして
        let URLText = myDefault.string(forKey: "URLText")
        //　文字列が入っていたらWebViewに表示する
        if let tmpStr = URLText{
            // URLリクエストを作って
            let myURL = URL(string: tmpStr)
            
            let myURLReq = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLReq)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapSearchBtn(_ sender: UIButton) {
        //WebViewに表示
        let URLText = myTextField.text
        
        //　文字列が入っていたらWebViewに表示する
        if let tmpStr = URLText{
            // URLリクエストを作って
            let myURL = URL(string: tmpStr)
            
            let myURLReq = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLReq)
            
            //ユーザデフォルトを用意する
            let myDefault = UserDefaults.standard
            
            //データを書きこんで
            myDefault.set(myTextField.text!, forKey: "URLText")
            
            //即反映させる
            myDefault.synchronize()
            
        }
        
        
    }
    
    @IBAction func tapTweetBtn(_ sender: UIButton) {
        //Facebookにシェア
        let FacebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        if let tmpStr =  myTextField.text{
            // URLリクエストを作って
            let url = URL(string: tmpStr)
            
            FacebookVC?.add(url)
            
        }

        
        present(FacebookVC!, animated: true, completion: nil)
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        
        myTextField.resignFirstResponder()
    }
    
    
    //GestureRecognizerのdelegateをselfに設定して使用する
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWithGestureRecognizer
        otherGestureRecognizer: UIGestureRecognizer
        ) -> Bool {
            return true
    }

}


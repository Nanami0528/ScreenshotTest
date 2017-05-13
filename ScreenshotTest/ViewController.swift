//
//  ViewController.swift
//  ScreenshotTest
//
//  Created by nanami on 2017/05/12.
//  Copyright © 2017年 nanami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var screenShot: UIImage!
    @IBOutlet var capturedImage : UIImageView!
    @IBOutlet var setview: UIView!

    override func viewDidLoad() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
    private func getScreenShot() -> UIImage {
        // キャプチャする範囲を取得.
        //let rect = self.view.bounds
        //let rect = CGRect(x: 10, y: 10, width: 50, height: 10)
        let rect = setview.frame

        
        // ビットマップ画像のcontextを作成.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        // 対象のview内の描画をcontextに複写する.
        self.view.layer.render(in: context)
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // contextを閉じる.
        UIGraphicsEndImageContext()
        
        return capturedImage
    }
    
    @IBAction func on (){
        
        // キャプチャ画像を取得 capturedImageのimageにセット.
        capturedImage.image = getScreenShot() as UIImage

        
    }

}


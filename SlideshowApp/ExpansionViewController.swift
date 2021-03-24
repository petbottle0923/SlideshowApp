//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 小栗栄行 on 2021/03/16.
//


import UIKit

class ExpansionViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var expansionImage:UIImage! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initImageView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let ViewController:ViewController = segue.destination as! ViewController
        
        ViewController.image1 = self.expansionImage
    }
    
    
    @objc func initImageView(){

        
        self.imageView.image = self.expansionImage
        
        // スクリーンの縦横サイズを取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        // 画像の縦横サイズを取得
        let imgWidth:CGFloat = self.expansionImage.size.width
        let imgHeight:CGFloat = self.expansionImage.size.height
        
        // 画像サイズをスクリーン幅に合わせる
        let scale:CGFloat = screenWidth / imgWidth
        let rect:CGRect = CGRect(x:0, y:0, width:imgWidth*scale, height:imgHeight*scale)
        
        // ImageView frame をCGRectでつくった矩形に合わせる
        self.imageView.frame = rect;
        
        // 画像の中心を画面の中心に設定
        self.imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(self.imageView)
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

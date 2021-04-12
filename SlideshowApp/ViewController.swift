//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小栗栄行 on 2021/03/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let images:[UIImage] = [UIImage(named:"IMG_4552.HEIC")!,UIImage(named:"IMG_4562.HEIC")!,UIImage(named:"IMG_4560.jpg")!]
    var pointer = 0
    
    var image1:UIImage! = nil
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.image1 = images[pointer]
        
        initImageView()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        
        expansionViewController.expansionImage = self.image1

        self.timer.invalidate()
        self.timer = nil

    }
    
    
    
    @IBAction func forward(_ sender: Any) {
        if self.timer == nil{
            if self.pointer != 2 {
                self.pointer += 1
            }else{
                self.pointer = 0
            }
            
            self.image1 = self.images[self.pointer]
            initImageView()
        }
    }

    @IBAction func back(_ sender: Any) {
        if self.timer == nil{
            if self.pointer != 0 {
                self.pointer -= 1
            }else{
                self.pointer = 2
            }
            
            self.image1 = self.images[self.pointer]
            initImageView()
        }
    }

    @IBAction func play(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target:self, selector: #selector(playShow(_:)), userInfo: nil, repeats: true)
        }else{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    @objc func playShow(_ timer: Timer){
        
        if self.pointer != 2 {
            self.pointer += 1
        }else{
            self.pointer = 0
        }
        self.image1 = self.images[self.pointer]
        
        initImageView()
    }
   
    @objc func initImageView(){

        
        self.imageView.image = self.image1
        
        // スクリーンの縦横サイズを取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        // 画像の縦横サイズを取得
        let imgWidth:CGFloat = self.image1.size.width
        let imgHeight:CGFloat = self.image1.size.height
        
        // 画像サイズをスクリーン幅に合わせる
        let scale:CGFloat = screenWidth / imgWidth
        let rect:CGRect = CGRect(x:0, y:0, width:imgWidth*scale*0.7, height:imgHeight*scale*0.7)
        
        // ImageView frame をCGRectでつくった矩形に合わせる
        self.imageView.frame = rect;
        
        // 画像の中心を画面の中心に設定
        self.imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(self.imageView)
    }
}


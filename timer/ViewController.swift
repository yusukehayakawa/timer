//
//  ViewController.swift
//  timer
//
//  Created by HayakawaYusuke on 2018/03/17.
//  Copyright © 2018年 HayakawaYusuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!

    var timer: Timer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func updateTimer(timer: Timer) {
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_sec)
//        "%.1f", 小数点第1位までの数字を表示するためのフォーマット設定
    }
    
    //    再生ボタン
    @IBAction func startTimer(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
        //        timeInterval は何秒毎に更新用関数が始動されるかを決める引数
        //        targetは更新用関数が定義されているクラスを指定 今回はselfなのでViewController.swift
        //        selector は更新用関数の名前の指定。target: self としたので、 ViewController.swift に更新用関数を自作する。#selector(updateTimer) とすれば、func updateTimer {...} として作成された更新用関数が timerInterval で指定された秒数毎（今回は 0.1 秒毎）に呼び出される
        //        userInfo は、タイマーとして渡したい値があれば設定
        //        repeats は、リピートするかどうか。 true とすれば、リピート（つまり0.1秒ごとに毎回呼び出し）false とすると、一度の呼び出しで終了
        
    }
    //    一時停止
    @IBAction func pauseTimer(_ sender: Any){
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    //    リセット
    @IBAction func resetTimer(_ sender: Any){
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
}


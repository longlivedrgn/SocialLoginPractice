//
//  ViewController.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Bundle.main.infoDictionary?["KakaoAppKey"] as! String)
        // Do any additional setup after loading the view.
    }


}


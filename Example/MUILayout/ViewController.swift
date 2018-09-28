//
//  ViewController.swift
//  MUILayout
//
//  Created by Michael Prummer on 09/28/2018.
//  Copyright (c) 2018 Michael Prummer. All rights reserved.
//

import UIKit
import MUILayout

class ViewController: UIViewController {
    var exampleView: UIView!
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
        let width: CGFloat = 40
        
        exampleView = mui.create.view(.mGreenBlue, radius: width/2)
        view.addSubview(exampleView)
        
        exampleView.layout([
            .width: width,
            .height: width,
            .top: 200,
            .centerX: 0
        ])
    
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


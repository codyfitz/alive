//
//  MainController.swift
//  Alive
//
//  Created by Cody R Fitzgerald on 12/21/14.
//  Copyright (c) 2014 Cody R Fitzgerald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var lin: UIButton!
    
    @IBOutlet weak var sup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
//        func printFonts() {
//            let fontFamilyNames = UIFont.familyNames()
//            for familyName in fontFamilyNames {
//                println("------------------------------")
//                println("Font Family Name = [\(familyName)]")
//                let names = UIFont.fontNamesForFamilyName(familyName as String)
//                println("Font Names = [\(names)]")
//            }
//        }
//        printFonts()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


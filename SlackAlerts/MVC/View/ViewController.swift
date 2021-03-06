//
//  ViewController.swift
//  SlackAlerts
//
//  Created by Kunal Gupta on 30/01/20.
//  Copyright © 2020 Kunal Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- OUTLETS

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    
    //MARK:- LIFE CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- SELF DEFINED

    func sendMessage() {
        SlackAlerts.postToSlack("API Response", tfMessage.text ?? "")
        tfMessage.text = ""
    }
    
    //MARK:- ACTION BUTTON

    @IBAction func actionBtnSend(_ sender: Any) {
        sendMessage()
    }

}

extension ViewController: UITextFieldDelegate {

    //MARK:- UITEXTFIELD DELEGATE

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendMessage()
        return true
    }
    
}

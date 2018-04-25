//
//  SecondViewController.swift
//  Burton- Your Langauge Barrier Buddy
//
//  Created by Liam Blenx on 16/06/2017.
//  Copyright © 2017 Blenx Industries. All rights reserved.
//

import UIKit
import AVFoundation
class SecondViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var next_Button: UIButton!
    @IBOutlet weak var switch_Perm: UISwitch!

    @IBAction func grantPermission(_ sender: UISwitch) {
        if sender.isOn {
            sender.setOn(true, animated:true)
        } else {
            sender.setOn(false, animated:true)
        }
    }

    
    @IBAction func targetChange(_ sender: UISwitch) {
        if sender.isOn == true {
            sender.setOn(true, animated: true)
            let session = AVAudioSession.sharedInstance()
            if (session.responds(to: #selector(AVAudioSession.requestRecordPermission(_:)))) {
                AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
                    if granted {
                        self.next_Button.isHidden = false
                        print("granted")
                        
                        do {
                            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
                            try session.setActive(true)
                        }
                        catch {
                            
                            print("Couldn't set Audio session category")
                        }
                    } else{
                        print("not granted")
                    }
                })
            }
        }
    
        else if sender.isOn == false  {
            next_Button.isHidden = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
 
         
         
     

    */



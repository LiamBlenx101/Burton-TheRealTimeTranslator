//
//  ThirdViewController.swift
//  Burton- Your Langauge Barrier Buddy
//
//  Created by Liam Blenx on 19/06/2017.
//  Copyright © 2017 Blenx Industries. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Date: UITextField!
    @IBOutlet weak var Lan: UITextField!
    @IBOutlet weak var pickerDate: UIView!
    @IBOutlet weak var pickerLang: UIView!
    var passData : String? = ""
    var passPicker : String? = ""
    var uInput_Name: String = ""
    var uInput_Date: String = ""
    var uInput_Lan: String = ""
    
    
   
    
// Edit Begin

    
    @IBAction func pickerN_Edit_Begin(_ sender: UITextField) {
        N_Edit_End(sender)
    }
    
    @IBAction func pickerD_Edit_Begin(_ sender: UITextField) {
        sender.resignFirstResponder()
        self.view.addSubview(pickerDate)

        
    }
    
    
    @IBAction func pickerL_Edit_Begin(_ sender: UITextField) {
        sender.resignFirstResponder()
        self.view.addSubview(pickerLang)
        
    }
    
    
    
// Edit End
    
    @IBAction func N_Edit_End(_ sender: UITextField) {
        getName()
        UserDefaults.standard.set(uInput_Name, forKey: "userName")
        
    }

    
    func removeSubview(x: Int){
        if let viewWithTag = self.view.viewWithTag(x){
        viewWithTag.removeFromSuperview()
        }
    }
    
    func getName(){
        uInput_Name = Name.text!
        
    }
    func getDate(){
        uInput_Date = Date.text!
        
    }
    func getLan(){
        uInput_Lan = Lan.text!
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    

    override func viewDidLoad() {
        Name.delegate = self
        if passData == "" {
        }
        else{
            Date.text = passData
            getDate()
            UserDefaults.standard.set(uInput_Date, forKey: "userDOB")
        }
        
        if passPicker == ""{
            }
        else{
            Lan.text = passPicker
            getLan()
            UserDefaults.standard.set(uInput_Lan, forKey: "userLan")
            }
        
        
        pickerDate.tag = 1
        pickerLang.tag = 2
        removeSubview(x: 1)
        removeSubview(x: 2)

       
        
       

    }
    
// Do any additional setup after loading the view.
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        if let x = UserDefaults.standard.object(forKey: "userName") as? String{
        Name.text = x
        }
        
        if let x = UserDefaults.standard.string(forKey: "userDOB"){
        Date.text = x
        }

        if let x = UserDefaults.standard.string(forKey: "userLan"){
        Lan.text = x
        }

}

}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


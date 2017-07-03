//
//  ViewController.swift
//  PickerView1
//
//  Created by Enamul Haque on 7/3/17.
//  Copyright © 2017 erainfoTectLtd. All rights reserved.
//

import UIKit

class ViewController:UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    //Text field Connect
    @IBOutlet weak var txtPickerTextField: UITextField!
    //Array declare
    let pickerArray = ["Bangladesh","India","Pakistan","USA"]
    var selectedRow = 0;
    //Picker View Object
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Don't forget to initialize pickerview delegate & datasource
        picker.delegate = self
        picker.dataSource = self
        txtPickerTextField.inputView = picker
        //Done Button function called
        doneButton();
    }
    public func numberOfComponents(in pickerView:  UIPickerView) -> Int  {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    public func pickerView(_pickerView:UIPickerView,numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row;
        txtPickerTextField.text = pickerArray[row]
        self.view.endEditing(false)
    }
    
    //begin  Doen Button function
    func doneButton(){
        
        let pickerView = picker
        pickerView.backgroundColor = .white
        pickerView.showsSelectionIndicator = true
        
        var toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.bordered, target: self, action: "donePicker")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.bordered, target: self, action: "canclePicker")
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        txtPickerTextField.inputView = pickerView
        txtPickerTextField.inputAccessoryView = toolBar
    }
    
    
    func donePicker() {
        self.txtPickerTextField.text = pickerArray[selectedRow]
        txtPickerTextField.resignFirstResponder()
    }
    
    func canclePicker() {
        txtPickerTextField.resignFirstResponder()
    }
    //End  Doen Button function
}

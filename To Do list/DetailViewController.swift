//
//  DetailViewController.swift
//  To Do list
//
//  Created by Sarah Minji Kim on 2/10/19.
//  Copyright © 2019 Sarah Minji Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var toDoNoteView: UITextView!
    
    var toDoItem: String?
    var toDoNoteItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "edit To Do Item"
        }else {
            self.navigationItem.title = "New To Do Item"
        }
        
        
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
        
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave"{
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    
    func enableDisableSaveButton () {
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    @IBAction func toDoFieldChange(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        }else {            navigationController?.popViewController(animated: true)
        }
    }
    
}





//
//  ViewController.swift
//  FoodApp
//
//  Created by Emmanuel Cuevas on 2/5/16.
//  Copyright © 2016 Emmanuel Cuevas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Mark:Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode{
            dismissViewControllerAnimated(true, completion: nil)
        } else{
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    var meal: Meal?
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        //Set up views if editing an existing Meal.
        if let meal = meal{
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        //Enable the Save button only if the text field has a valid Meal name.
        checkValidMealName()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        mealNameLabel.text = textField.text
        
        //Implementing the two following methods
        checkValidMealName()
        navigationItem.title = textField.text
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        //Disable the Save button while editing
        saveButton.enabled = false
        
    }
    
    func checkValidMealName(){
        
        //Disable the Save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
        
    }
  
    //Mark: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        //Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Mark: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        
        //UIImagePickerController is a view controller that lests a usre pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        //Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    @IBAction func libraryImage(sender: UIButton) {
        //Enter to the library
    }
    
    //Mark: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender{
            
            //This method lets you configure a view controller before it's presented.
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            //Set the meal to be passed to MealTableViewController after the unwind segue.
            
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    



}


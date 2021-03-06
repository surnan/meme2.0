//
//  ViewController.swift
//  Meme_1
//
//  Created by admin on 11/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit


class MemeCreationController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    //MARK:- UI Var
    var currentIndex = 0
    var currentMeme: Meme? {
        didSet{
            backgroundImageView.image = currentMeme?.originalImage
            topTextField.text = currentMeme?.top
            bottomTextField.text = currentMeme?.bottom
        }
    }
    
    var backgroundImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = UIColor.black
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var topTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.borderStyle = .none
        textField.clearsOnBeginEditing = true
        let memeTextAttributes:[NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key.strokeWidth: -4.6
        ]
        textField.defaultTextAttributes = memeTextAttributes
        let memeText = NSMutableAttributedString(string: "TOP", attributes: memeTextAttributes)
        textField.attributedText = memeText
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    var bottomTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.borderStyle = .none
        textField.clearsOnBeginEditing = true
        let memeTextAttributes:[NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key.strokeWidth: -4.6
        ]
        textField.defaultTextAttributes = memeTextAttributes
        let memeText = NSMutableAttributedString(string: "BOTTOM", attributes: memeTextAttributes)
        textField.attributedText = memeText
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    func setupTextFieldAndBackgroundImage(){
        [backgroundImageView].forEach{view.addSubview($0)}
        [topTextField, bottomTextField].forEach{backgroundImageView.addSubview($0)}
        NSLayoutConstraint.activate([
            topTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            bottomTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }
    
    //MARK: Toolbars
    var topToolbar: UIToolbar = {
        var toolbar = UIToolbar()
        toolbar.barTintColor = UIColor.lightGray
        toolbar.isTranslucent = false
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()
    
    var bottomToolbar: UIToolbar = {
        var toolbar = UIToolbar()
        toolbar.barTintColor = UIColor.lightGray
        toolbar.isTranslucent = false
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()
    
    //MARK:- Constraints
    func setupUI_and_Contraints(){
        setupTopToolBar()
        setupBottomToolBar()
        [topToolbar, bottomToolbar].forEach{backgroundImageView.addSubview($0)}
        NSLayoutConstraint.activate([
            topToolbar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomToolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }
    
    //MARK:- Override Swift Functions
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotification()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unsubscribeToKeyboardNotification()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setupTextFieldAndBackgroundImage()
        setupUI_and_Contraints()
        [topTextField, bottomTextField].forEach{
            $0.addTarget(self, action: #selector(myTextFieldTextChanged), for: UIControl.Event.editingChanged)
            $0.delegate = self
        }
        if currentMeme != nil {
            loadAllGestures()
            showTopAndBottomToolbars(makeVisible: false)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleActivityBarButton))
    }
    
    //MARK:- Handler Functions <---> currentMeme? != nil
    @objc func handleActivityBarButton() {
        let currentMeme2 = saveMeme2()
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        myAppDelegate.memes.append(currentMeme2)
        let items = [currentMeme2.finalImage]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityVC.completionWithItemsHandler = {[unowned self](activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if !completed {
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
        present(activityVC, animated: true)
    }
    
    func saveMeme2()-> Meme {
        let currentMeme = Meme(topTxtField: topTextField, bottomTxtField: bottomTextField, originalImageView: backgroundImageView, memeImage: generateMemedImage())
        return currentMeme
    }
}

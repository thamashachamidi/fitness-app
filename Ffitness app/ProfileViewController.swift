//
//  ProfileViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-19.
//

import UIKit

class ProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your name"
        return textField
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height (cm):"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let heightTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your height"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight (kg):"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let weightTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your weight"
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your age"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
        
        // Add Sign Out button to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sign Out",
            style: .plain,
            target: self,
            action: #selector(didTapSignOut)
        )
        
        setupScrollView()
        setupContentView()
        setupProfileImageView()
        setupNameField()
        setupHeightField()
        setupWeightField()
        setupAgeField()
        setupGenderSegmentedControl()
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectProfileImage))
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func selectProfileImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            profileImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapSignOut() {
       
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
    }
    
    private func setupProfileImageView() {
        contentView.addSubview(profileImageView)
    }
    
    private func setupNameField() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameTextField)
    }
    
    private func setupHeightField() {
        contentView.addSubview(heightLabel)
        contentView.addSubview(heightTextField)
    }
    
    private func setupWeightField() {
        contentView.addSubview(weightLabel)
        contentView.addSubview(weightTextField)
    }
    
    private func setupAgeField() {
        contentView.addSubview(ageLabel)
        contentView.addSubview(ageTextField)
    }
    
    private func setupGenderSegmentedControl() {
        contentView.addSubview(genderLabel)
        contentView.addSubview(genderSegmentedControl)
    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            heightLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            heightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            heightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 8),
            heightTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            heightTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            weightLabel.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 16),
            weightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            weightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 8),
            weightTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            weightTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            ageLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 16),
            ageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            ageTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ageTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            genderLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 16),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            genderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            genderSegmentedControl.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 8),
            genderSegmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            genderSegmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            genderSegmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}

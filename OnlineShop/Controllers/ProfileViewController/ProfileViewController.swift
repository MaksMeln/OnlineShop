//
//  ProfileViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//


import UIKit

final class ProfileViewController : OnlineShopBaseViewController {
    
//MARK: - PROPERTIES
    private let titleLabel = OSLabel(textLabel: Resources.String.ProfileController.title,
                                     font: Resources.Fonts.MontserratBold(with: 15),
                                     textColor: Resources.Colors.Default.defaultBlack)
    
    private var profilePhoto = OSRoundedImageView(with: .profile)
    
    
    private let changePhotoButton = OSButton(with: .changePhoto)
    
    private var nameProfileLabel = OSLabel(textLabel: Resources.String.ProfileController.nameProfile,
                                           font: Resources.Fonts.MontserratBold(with: 15),
                                           textColor: Resources.Colors.OtherColors.nameLabel)
    
    private let uploudItemButton = OSButton(with: .uploadItem)
     
    private let buttonView = ProfileButtonView()
    
}
//MARK: - LIFECYCLE
extension ProfileViewController {

    override func setupViews() {
        super.setupViews()
        
        view.setupView(titleLabel)
        view.setupView(profilePhoto)
        view.setupView(changePhotoButton)
        view.setupView(nameProfileLabel)

        view.setupView(buttonView)
//        view.setupView(profilePhotoView)
        view.setupView(uploudItemButton)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 65),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profilePhoto.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 19),
            profilePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            changePhotoButton.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 8),
            changePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changePhotoButton.heightAnchor.constraint(equalToConstant: 9),
            
            nameProfileLabel.topAnchor.constraint(equalTo: changePhotoButton.bottomAnchor, constant: 20),
            nameProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            uploudItemButton.topAnchor.constraint(equalTo: nameProfileLabel.bottomAnchor, constant: 38),
            uploudItemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonView.topAnchor.constraint(equalTo: uploudItemButton.bottomAnchor, constant: 14),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        profileButtonsAction()
        navigationController?.navigationBar.isHidden = true
        
        setModel()
    }
    
//MARK: - profileButtonsAction
    private func profileButtonsAction() {
        changePhotoButton.addTarget(self, action: #selector(changePhotonButtonPress), for: .touchUpInside)
        uploudItemButton.addTarget(self, action: #selector(uploudItemButtonPress), for: .touchUpInside)
        
        buttonView.profileButtonAction(button: buttonView.tradeStoreButton ,#selector(tradeStoreButtonPress), with: self)
        buttonView.profileButtonAction(button: buttonView.paymentMethodButton ,#selector(paymentMethodButtonPress), with: self)
        buttonView.profileButtonAction(button: buttonView.balanceButton ,#selector(balanceButtonPress), with: self)
        buttonView.profileButtonAction(button: buttonView.tradeHistoryButton ,#selector(tradeHistoryButtonPress), with: self)
        buttonView.profileButtonAction(button: buttonView.restorePurchaseButton ,#selector(restorePurchaseButtonPress), with: self)
        buttonView.profileButtonAction(button: buttonView.helpButton ,#selector(helpButtonPress), with: self)
        buttonView.profileButtonAction(button: buttonView.logOutButton ,#selector(logOutButtonPress), with: self)
    }
    
    
//MARK: - BUTTON TARGET
    @objc func changePhotonButtonPress() {
      presentPhotoActionSheet()
    }
    
    
    @objc func uploudItemButtonPress() {
     print("uploudItemButton press")
    }
    
    
    @objc func tradeStoreButtonPress() {
        print("tradeStoreButton press")
    }
    
    @objc func paymentMethodButtonPress() {
        print("paymentMethodButton press")
    }
    
    @objc func balanceButtonPress() {
        print("balanceButton press")
    }
    
    @objc func tradeHistoryButtonPress() {
        print("tradeHistoryButton press")
    }
    
    @objc func restorePurchaseButtonPress() {
        print("restorePurchaseButton press")
    }
    
    @objc func helpButtonPress() {
        print("helpButton press")
    }
    
    @objc func logOutButtonPress() {
        let signInViewController = SignInViewController()
        
        view.window?.rootViewController = signInViewController
        view.window?.makeKeyAndVisible()    }
    
    func setModel() {
        guard let activeUser = DataBase.shared.activeUser else {return}
        nameProfileLabel.text = activeUser.firstName
    }

}

// MARK: - EXTENSION UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Photo",
                                            message: "How would you like to select a picture?",
                                            preferredStyle: .actionSheet)
       
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        
        actionSheet.addAction(UIAlertAction(title: "Chose Photo",
                                            style: .default,
                                            handler:  { [weak self] _ in
                                            self?.presentPhotoPicker()
        }))
        present(actionSheet, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        
        self.profilePhoto.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

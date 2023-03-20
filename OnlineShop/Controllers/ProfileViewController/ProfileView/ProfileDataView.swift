//
//  ProfileImageView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 14.03.23.
//

import UIKit

final class ProfileDataView: OnlineShopBaseView {
    
    
    private var profilePhoto : UIImageView = {
        var profileImage = UIImageView()
        profileImage.image = Resources.Images.ProfileController.profileImage
        profileImage.layer.masksToBounds = true
        profileImage.contentMode = .scaleAspectFit
        profileImage.setDimensions(height: 60, width: 60)
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderColor = Resources.Colors.OtherColors.borderColorProfileImage.cgColor
        profileImage.layer.borderWidth = 1
        profileImage.clipsToBounds = true
        
        return profileImage
    }()
    
    
    private let changePhotonButton : UIButton = {
        let button = UIButton()
        button.setTitle(Resources.String.ProfileController.changePhotoLabel,
                        for: .normal)
        button.setTitleColor(Resources.Colors.Default.defaultGray, for: .normal)
        button.titleLabel?.font = Resources.Fonts.MontserratMedium(with: 8)
//        button.addTarget(self, action: #selector(changePhotonButtonPress), for: .touchUpInside)
        
        return button
    }()
    
    private let nameProfileLabel = OSLabel(textLabel: Resources.String.ProfileController.nameProfile,
                                           font: Resources.Fonts.MontserratBold(with: 15),
                                           textColor: Resources.Colors.OtherColors.nameLabel)
    
//    private let contentView : UIView = {
//       let contenView = UIView()
//        return contenView
//
//    }()
}


extension ProfileDataView {
    
    
    
    override func setupViews() {
        super.setupViews()
        
//        self.contentView
        
        
        self.setupView(profilePhoto)
        self.setupView(changePhotonButton)
        self.setupView(nameProfileLabel)
        self.backgroundColor = .blue
        
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
//            profilePhoto.topAnchor.constraint(equalTo: contentView.topAnchor),
//            profilePhoto.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//
//            changePhotonButton.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 9),
//            changePhotonButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            changePhotonButton.heightAnchor.constraint(equalToConstant: 9),
//
//            nameProfileLabel.topAnchor.constraint(equalTo: changePhotonButton.bottomAnchor, constant: 20),
//            nameProfileLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}


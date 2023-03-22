//
//  OSRoundedImageView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import Foundation
import UIKit

public enum OSRoundedImageViewType {
    case profile
    case page1
    
}
final class OSRoundedImageView : UIImageView {
    
    private var type: OSRoundedImageViewType = .profile
    
    
    init(with type: OSRoundedImageViewType) {
        super.init(frame: .zero)
        self.type = type
        
        clipsToBounds = true
        
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        clipsToBounds = true
        configureAppearance()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        assert(bounds.height == bounds.width)
        layer.cornerRadius = bounds.height / 2
    }
}

private extension OSRoundedImageView {
    
    //MARK: - CONFIGUREAPPEARANCE
    func configureAppearance() {
        switch type {
            
        case .profile:
            image = Resources.Images.ProfileController.profileImage
            setDimensions(height: 60, width: 60)
            layer.borderColor = Resources.Colors.OtherColors.borderColorProfileImage.cgColor
            layer.borderWidth = 2
        case .page1:
            image = Resources.Images.ProfileController.profileImage
            setDimensions(height: 30, width: 30)
            layer.borderColor = Resources.Colors.OtherColors.borderColorPage1Image.cgColor
            layer.borderWidth = 2
        }
        
    }
}

// MARK: - EXTENSION UIIMAGEVIEW - FROM API
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

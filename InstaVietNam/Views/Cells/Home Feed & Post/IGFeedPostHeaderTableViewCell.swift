//
//  IGFeedPostHeaderTableViewCell.swift
//  InstaVietNam
//
//  Created by Ngọc Thiện on 12/09/2022.
//

import UIKit
import SDWebImage

protocol IGFeedPostHeaderTableViewCellDelegate: AnyObject {
    func didTapMoreButton()
}

final class IGFeedPostHeaderTableViewCell: UITableViewCell {
    
    weak var delegate: IGFeedPostHeaderTableViewCellDelegate?

    static let identifier = "IGFeedPostHeaderTableViewCell"

    //Declare SubView
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(profilePhotoImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(moreButton)
        moreButton.addTarget(self,
                             action: #selector(didTapGridButton),
                             for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapGridButton() {
        delegate?.didTapMoreButton()
    }
    
    //Configure the cell
    public func configure(with model: User) {
        usernameLabel.text = model.username
        profilePhotoImageView.image = UIImage(systemName: "person.circle")
//        profilePhotoImageView.sd_setImage(with: model.profilePhoto, completed: nil)
    }
    
    //Layout SubView
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = contentView.height - 4
        
        profilePhotoImageView.frame = CGRect(x: 2,
                                             y: 2,
                                             width: size,
                                             height: size)
        profilePhotoImageView.layer.cornerRadius = size/2
        
        moreButton.frame = CGRect(x: contentView.width - size,
                                  y: 2,
                                  width: size,
                                  height: size)
        
        usernameLabel.frame = CGRect(x: profilePhotoImageView.right + 10,
                                     y: 2,
                                     width: contentView.width - (size*2) - 15,
                                     height: contentView.height - 4)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        usernameLabel.text = nil
        profilePhotoImageView.image = nil
    }
}

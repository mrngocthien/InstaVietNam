//
//  IGFeedPostTableViewCell.swift
//  InstaVietNam
//
//  Created by Ngọc Thiện on 12/09/2022.
//

import UIKit
import SDWebImage
import AVFoundation

///Cell for primary post content
final class IGFeedPostTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostTableViewCell"
    
    //Declare SubView
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = nil
        imageView.clipsToBounds = true
        return imageView
    }()

    private var player: AVPlayer?
    private var playerLayer =  AVPlayerLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.addSublayer(playerLayer)
        contentView.addSubview(postImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Configure the cell
    public func configure(with post: UserPost) {
        postImageView.image = UIImage(named: "test")
        
        return
        switch post.postType {
            case .photo:
                //Show image
                postImageView.sd_setImage(with: post.postURL, completed: nil)
            case .video:
                //Load & play video
            player = AVPlayer(url: post.postURL)
            playerLayer.player = player
            playerLayer.player?.volume = 0
            playerLayer.player?.play()
        }
    }
    
    //Layout Subview
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = contentView.bounds
        postImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }
}

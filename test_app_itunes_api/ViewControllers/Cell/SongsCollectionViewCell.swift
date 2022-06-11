//
//  SongsCollectionViewCell.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import UIKit

class SongsCollectionViewCell: UICollectionViewCell {
    
    let songNameLabel: UILabel = {
        let songNameLabel = UILabel()
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return songNameLabel
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConstraints() {
        self.addSubview(songNameLabel)
        NSLayoutConstraint.activate([
            songNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            songNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            songNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            songNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}

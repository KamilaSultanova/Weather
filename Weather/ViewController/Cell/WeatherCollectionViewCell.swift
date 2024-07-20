//
//  WeatherCollectionViewCell.swift
//  Weather
//
//  Created by Kamila Sultanova on 19.07.2024.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements

    @IBOutlet weak var contentview: UIView!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    // MARK: - UI Elements
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        setupView()
    }
    
    // MARK: - Setup Method
    
    func setupView(){
        contentview.layer.cornerRadius = 20
        contentview.layer.borderColor = UIColor.cellBorder.cgColor
        contentview.layer.borderWidth = 1
    }
    
    // MARK: - Configuration Method
    
    func configure(with weatherType: Weather) {
        weatherIcon.image = weatherType.image
        weatherLabel.text = weatherType.localizedType
    }
}

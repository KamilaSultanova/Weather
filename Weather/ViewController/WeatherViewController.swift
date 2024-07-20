//
//  WeatherViewController.swift
//  Weather
//
//  Created by Kamila Sultanova on 19.07.2024.
//

import UIKit

class WeatherViewController: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var weatherView: UIView!
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    private let weatherConditions: [Weather] = [
        .sunny, .rain, .snowing, .storm,  .clear, .cloudly, .windy, .fog
    ]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupInitialWeather()
        showPopUpView()
    }
    
    // MARK: - Setup Methods
    
    private func setupViews(){
        popUpView.layer.cornerRadius = 24
        popUpView.isHidden = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupInitialWeather(){
        let randomWeather = weatherConditions.randomElement() ?? .clear
        updateWeatherView(for: randomWeather)
    }
    
    private func showPopUpView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.popUpView.isHidden = false
            self.popUpView.alpha = 0
            UIView.animate(withDuration: 1.0, animations: {
                self.popUpView.alpha = 1.0
            })
        }
    }
    
    private func updateWeatherView(for weatherType: Weather) {
        UIView.transition(with: self.weatherView, duration: 1.5, options: .transitionCrossDissolve, animations: {
            self.weatherView.backgroundColor = weatherType.color
            self.imageView.image = weatherType.image
        }, completion: nil)
    }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherConditions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCollectionViewCell
        cell.configure(with: weatherConditions[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedWeatherType = weatherConditions[indexPath.row]
        updateWeatherView(for: selectedWeatherType)
    }
}

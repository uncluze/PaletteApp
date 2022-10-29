//
//  ViewController.swift
//  PaletteApp
//
//  Created by uncluze on 29.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var paletteView: UIView!
    @IBOutlet var statusRedSliderLabel: UILabel!
    @IBOutlet var statusGrenColorLabel: UILabel!
    @IBOutlet var statusBlueColorLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paletteView.layer.cornerRadius = 10
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        
        setColor()
        setValue(for: statusRedSliderLabel, statusGrenColorLabel, statusBlueColorLabel)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
                
        switch sender.tag {
        case 0: statusRedSliderLabel.text = string(from: sender)
        case 1: statusGrenColorLabel.text = string(from: sender)
        case 2: statusBlueColorLabel.text = string(from: sender)
        default: break
        }
    }
    
    private func setColor() {
        paletteView.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 100,
                                               green: CGFloat(greenSlider.value) / 100,
                                               blue: CGFloat(blueSlider.value) / 100,
                                               alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: statusRedSliderLabel.text = string(from: redSlider)
            case 1: statusGrenColorLabel.text = string(from: greenSlider)
            case 2: statusBlueColorLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(Int(slider.value))
    }
}

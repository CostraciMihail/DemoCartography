//
//  SeconViewController.swift
//  DemoCartography
//
//  Created by winify on 4/26/17.
//  Copyright © 2017 misa.organization. All rights reserved.
//

import UIKit
import Cartography


class SeconViewController: UIViewController {
    
    let imgView = UIImageView(frame: CGRect.zero)
    let userLabel = UILabel(frame: CGRect.zero)
    
    //EURO
    let euroCurrencyLabel = UILabel(frame: CGRect.zero)
    let euroValueLabel = UILabel(frame: CGRect.zero)
    
    //CHF
    let chfCurrencyLabel = UILabel(frame: CGRect.zero)
    let chfValueLabel = UILabel(frame: CGRect.zero)
    
    //DOLAR
    let dolarCurrencyLabel = UILabel(frame: CGRect.zero)
    let dolarValueLabel = UILabel(frame: CGRect.zero)
    
    let labelsGroup = UIStackView()
    let labelsGroupAndUserGroup = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.alpha = 0.5
        
        self.addViews()
        self.addConstraintsToAllViews()
        
    }
    
    func addViews() {
        
        //IMAGE
        imgView.image = UIImage(named: "img1")
        self.view.addSubview(imgView)
        
        //USER LABEL
        userLabel.backgroundColor = UIColor.green
        userLabel.text = "User Name"
        self.view.addSubview(userLabel)
        
        //EURO CURRENCY LABEL
        euroCurrencyLabel.backgroundColor = UIColor.yellow
        euroCurrencyLabel.text = "EURO"
        self.view.addSubview(euroCurrencyLabel)
        
        //EURO VALUE LABEL
        euroValueLabel.backgroundColor = UIColor.yellow
        euroValueLabel.text = "23.65"
        self.view.addSubview(euroValueLabel)
        
        
        //CHF CURRENCY LABEL
        chfCurrencyLabel.backgroundColor = UIColor.yellow
        chfCurrencyLabel.text = "CHF"
        self.view.addSubview(chfCurrencyLabel)
        
        //CHF VALUE LABEL
        chfValueLabel.backgroundColor = UIColor.yellow
        chfValueLabel.text = "23.65"
        self.view.addSubview(chfValueLabel)
        
        
        //DOLAR CURRENCY LABEL
        dolarCurrencyLabel.backgroundColor = UIColor.yellow
        dolarCurrencyLabel.text = "DOLAR"
        self.view.addSubview(dolarCurrencyLabel)
        
        //DOLAR VALUE LABEL
        dolarValueLabel.backgroundColor = UIColor.yellow
        dolarValueLabel.text = "23.65"
        self.view.addSubview(dolarValueLabel)


        //FIRST GROUP STACKVIEW
        labelsGroup.alignment = .center
        labelsGroup.axis = .horizontal
        labelsGroup.distribution = .equalSpacing
        labelsGroup.spacing = 5
        
        labelsGroup.addArrangedSubview(euroCurrencyLabel)
        labelsGroup.addArrangedSubview(euroValueLabel)
        
        labelsGroup.addArrangedSubview(chfCurrencyLabel)
        labelsGroup.addArrangedSubview(chfValueLabel)
        self.view.addSubview(labelsGroup)
    
        labelsGroup.addArrangedSubview(dolarCurrencyLabel)
        labelsGroup.addArrangedSubview(dolarValueLabel)
        
        //SECOND GROUP STACKVIEW
        labelsGroupAndUserGroup.alignment = .fill
        labelsGroupAndUserGroup.axis = .vertical
        labelsGroupAndUserGroup.distribution = .equalSpacing
        labelsGroupAndUserGroup.spacing = 10
        
        labelsGroupAndUserGroup.addArrangedSubview(userLabel)
        labelsGroupAndUserGroup.addArrangedSubview(labelsGroup)
        self.view.addSubview(labelsGroupAndUserGroup)
    }
    
    func addConstraintsToAllViews() {
        
        //IMAGE VIEW
        constrain(self.imgView) { (image) in
            
            image.width == 80
            image.height == 80
            
            image.top == image.superview!.top + 100
            image.leading == image.superview!.leading + 15
        }
        
        //USER LABEL
        constrain(self.userLabel) { (user) in
            
            user.width == 200
            user.height == 30
        }
        
       self.addConstraintsTolabelsGroup()
        
        //SECOND GROUP
        constrain(self.imgView, self.labelsGroupAndUserGroup) { (image, secondG) in
            
            if let supView = secondG.superview {
                
                secondG.leading == image.trailing + 15
                secondG.top == supView.top + 100
                secondG.trailing == supView.trailing - 15
            }
        }

    }
    
    
    
    func addConstraintsTolabelsGroup() {
        
        //FIRST GROUP
        constrain(self.euroCurrencyLabel, self.euroValueLabel) { (currencyLabel, valueLabel) in
            
//            currencyLabel.width == 70
//            currencyLabel.height == 30
//            
//            valueLabel.width == 70
//            valueLabel.height == 30
        }
    }
    
    
    
}

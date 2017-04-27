//
//  ConstraintsViewController.swift
//  DemoCartography
//
//  Created by winify on 4/26/17.
//  Copyright © 2017 misa.organization. All rights reserved.
//

import UIKit
import Cartography


class ConstraintsViewController: UIViewController {
    
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
    let labelsGroupAndUserLabel = UIStackView()
    var constGroup = ConstraintGroup()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        self.addViews()
        self.addConstraintsToAllViews()
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { 
        }
    }
    
    func addViews() {
        
        //IMAGE
        imgView.image = UIImage(named: "img1")
        self.view.addSubview(imgView)
        
        //USER LABEL
        userLabel.backgroundColor = UIColor.green
        userLabel.text = " "
        userLabel.numberOfLines = 0
        userLabel.lineBreakMode = .byWordWrapping
        
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
        labelsGroupAndUserLabel.alignment = .fill
        labelsGroupAndUserLabel.axis = .vertical
        labelsGroupAndUserLabel.distribution = .equalSpacing
        labelsGroupAndUserLabel.spacing = 10
        
        labelsGroupAndUserLabel.addArrangedSubview(userLabel)
        labelsGroupAndUserLabel.addArrangedSubview(labelsGroup)
        self.view.addSubview(labelsGroupAndUserLabel)
    }
    
    func addConstraintsToAllViews() {
        
        //IMAGE VIEW
        constrain(self.imgView) { (image) in
            image.width == 80
            image.height == 80
            
            image.top == image.superview!.top + 100
            image.leading == image.superview!.leading + 15
        }
        
        //labels Group And User Group GROUP
        constrain(self.imgView, self.labelsGroupAndUserLabel) { (image, secondG) in
            
            if let supView = secondG.superview {
                secondG.leading == image.trailing + 15
                secondG.top == supView.top + 100
                secondG.trailing == supView.trailing - 15
                secondG.bottom == supView.bottom - 300
            }
        }
        
        constrain(self.userLabel, self.labelsGroup) { ( user, group) in

//            user.height == 30
//            if let supView = user.superview {
//                user.top == supView.top
//                user.leading == supView.leading
//                user.trailing == supView.trailing
//                user.bottom == group.top + 5
//            }
        }
    
    
    
    }
    
}

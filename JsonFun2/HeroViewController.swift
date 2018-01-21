//
//  HeroViewController.swift
//  JsonFun2
//
//  Created by Emerson Fonseca on 21/01/2018.
//  Copyright © 2018 Emerson Fonseca. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageVieuw: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var legsLabel: UILabel!
    
    var hero: HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = hero?.localized_name
        attackLabel.text = hero?.primary_attr
        attackLabel.text = hero?.attack_type
        legsLabel.text = "\(hero?.legs)"
    }
    
    

}

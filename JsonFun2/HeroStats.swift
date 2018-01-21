//
//  HeroStats.swift
//  JsonFun2
//
//  Created by Emerson Fonseca on 21/01/2018.
//  Copyright © 2018 Emerson Fonseca. All rights reserved.
//

import Foundation

struct HeroStats:Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
    
}

//
//  SearchableRecord.swift
//  Continuum
//
//  Created by Jeremy Taylor on 12/9/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

protocol SearchableRecord: AnyObject {
    func  matches(searchTerm: String) -> Bool
}

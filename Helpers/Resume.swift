//
//  Resume.swift
//  ResumeMaker
//
//  Created by Saifur on 2/10/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation

class Resume {
    public var id: Int
    public var user_id: Int
    
    init(id: Int, user_id: Int) {
        self.id = id
        self.user_id = user_id
    }
}

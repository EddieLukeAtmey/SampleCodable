//
//  main.swift
//  SampleRequest
//
//  Created by NTQ on 12/4/18.
//  Copyright © 2018 NTQ. All rights reserved.
//

import Foundation

SCRequest.requestUser { (u, e) in
    if let u = u { print(u) }
    else if let e = e { print(e) }

    CFRunLoopStop(CFRunLoopGetCurrent())
}

CFRunLoopRun()

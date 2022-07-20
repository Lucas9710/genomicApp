//
//  Helpers.swift
//  GenomicApp
//
//  Created by Lucas on 12/07/2022.
//

import Foundation
import UIKit

typealias SequenceUpdate = (Sequence) -> ()
typealias StateAction = (Bool) -> ()

func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
    return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
}

func CGPointDistance(from: CGPoint, to: CGPoint) -> CGFloat {
    return sqrt(CGPointDistanceSquared(from: from, to: to))
}

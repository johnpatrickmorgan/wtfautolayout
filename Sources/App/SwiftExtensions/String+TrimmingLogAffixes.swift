//
//  String+TrimmingLogAffixes.swift
//  WTFAutoLayout
//
//  Created by John Morgan on 10/09/2017.
//
//

import Foundation

extension String {
    
    func trimmingLogAffixes() -> String {
        
        return self.trimmingLogSuffix().trimmingLogPrefix()
    }
    
    func trimmingLogPrefix() -> String {
        
        let prefixEnd1 = "refer to the documentation for the UIView property translatesAutoresizingMaskIntoConstraints)"
        let prefixEnd2 = "(2) find the code that added the unwanted constraint or constraints and fix it."
        
        guard let range = range(of: prefixEnd1) ?? range(of: prefixEnd2) else {
            return self
        }
        
        return String(self[range.upperBound...])
    }
    
    func trimmingLogSuffix() -> String {
        
        let suffixStart = "Will attempt to recover by breaking constraint"
        
        guard let range = range(of: suffixStart) else {
            return self
        }
        
        return String(self[...range.lowerBound])
    }
}

//
//  String+Extensions.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 23/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import Foundation

extension String {
    
    internal func indexOf(_ sub: String) -> Int? {
        guard let range = self.range(of: sub), !range.isEmpty else {
            return nil
        }
        return self.characters.distance(from: self.startIndex, to: range.lowerBound)
    }
    
    internal subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.characters.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.characters.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex..<endIndex]
        }
    }
    
    
    func urlEncodedString(_ encodeAll: Bool = false) -> String {
        var allowedCharacterSet: CharacterSet = .urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: "\n:#/?@!$&'()*+,;=")
        if !encodeAll {
            allowedCharacterSet.insert(charactersIn: "[]")
        }
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!
    }
    
    var queryStringParameters: Dictionary<String, String> {
        var parameters = Dictionary<String, String>()
        
        let scanner = Scanner(string: self)
        
        var key: String?
        var value: String?
        
        while !scanner.isAtEnd {
            key = scanner.scanUpToString("=")
            _ = scanner.scanString(string: "=")
            
            value = scanner.scanUpToString("&")
            _ = scanner.scanString(string: "&")
            
            if let key = key, let value = value {
                parameters.updateValue(value, forKey: key)
            }
        }
        
        return parameters
    }
}

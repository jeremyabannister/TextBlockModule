//
//  TextBlockConvertible.swift
//  
//
//  Created by Jeremy Bannister on 9/16/22.
//

///
public protocol TextBlockConvertible {
    
    ///
    var asTextBlock: TextBlock { get }
}

///
public extension TextBlockConvertible {
    
    ///
    func multilineDescription (indentationCount: Int = 0) -> String {
        self
            .asTextBlock
            .indented(by: indentationCount)
            .joined(separator: "\n")
    }
}

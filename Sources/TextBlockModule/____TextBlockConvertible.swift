//
//  TextBlockConvertible.swift
//  
//
//  Created by Jeremy Bannister on 9/16/22.
//

// MARK: - multilineDescription

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


// MARK: - TextBlockConvertible

///
public protocol TextBlockConvertible {
    
    ///
    var asTextBlock: TextBlock { get }
}

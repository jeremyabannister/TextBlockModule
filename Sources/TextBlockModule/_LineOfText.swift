//
//  LineOfText.swift
//  
//
//  Created by Jeremy Bannister on 9/16/22.
//

///
public typealias LineOfText = String

///
extension LineOfText {
    
    ///
    public func indented (by indentationCount: Int = 1) -> LineOfText {
        Self.indentation(indentationCount) + self
    }
    
    ///
    private static func indentation(_ n: Int) -> String {
        (0 ..< n).reduce(into: "") { string, _ in string += "    " }
    }
}

//
//  text_block_creation.swift
//  
//
//  Created by Jeremy Bannister on 9/16/22.
//

///
public extension TextBlock {
    
    ///
    init (_ anyValue: Any) {
        
        ///
        if let textBlockConvertible = anyValue as? TextBlockConvertible {
            self = textBlockConvertible.asTextBlock
            
        } else if let stringConvertible = anyValue as? CustomStringConvertible {
            self = [stringConvertible.description]
            
        } else {
            self = ["\(anyValue)"]
        }
    }
    
    ///
    static func callBlock (header: String?,
                           bracketType: TextBracketType,
                           nestedBlock: TextBlock)
        -> TextBlock {
        
        ///
        let callHead = (header ?? "") + bracketType.opener
        
        ///
        if nestedBlock.isEmpty {
            return [callHead + bracketType.closer]
            
        } else if let onlyLine = nestedBlock.only {
            return [callHead + onlyLine + bracketType.closer]
            
        } else {
            return [callHead] + nestedBlock.indented() + [bracketType.closer]
        }
    }
    
    ///
    static func parameterList (_ keyValuePairs: (String, Any)...) -> TextBlock {
        parameterList(keyValuePairs)
    }
    
    ///
    static func parameterList (_ keyValuePairs: [(String, Any)]) -> TextBlock {
        keyValuePairs
            .map { TextBlock($0.1).addingParameterLabel($0.0) }
            .joinedAsCommaSeparatedList
    }
    
    ///
    static func indented (by indentationCount: Int = 1,
                          _ textBlock: TextBlock)
        -> TextBlock {
        
        textBlock.indented(by: indentationCount)
    }
    
    ///
    func addingParameterLabel (_ label: String) -> TextBlock {
        
        ///
        if self.count.isGreater(than: 1) {
            return [label + ":"] + self.indented()
        } else {
            return [label + ":" + (self.first?.prepending(" ") ?? "")]
        }
    }
    
    ///
    func indented (by indentationCount: Int = 1) -> TextBlock {
        self.map { $0.indented(by: indentationCount) }
    }
    
    ///
    static func indentation (_ n: Int) -> String {
        (0 ..< n).reduce(into: "") { string, _ in string += "    " }
    }
}

///
public extension Array where Element == TextBlock {
    
    ///
    var joinedAsCommaSeparatedList: TextBlock {
        self.reduce(into: TextBlock()) { result, nextTextBlock in
            if result.isNotEmpty { result.mutateLast { $0 += "," } }
            result += nextTextBlock
        }
    }
}

//
//  text_block_creation.swift
//  
//
//  Created by Jeremy Bannister on 9/16/22.
//

// MARK: - memberwise

///
extension TextBlock {
    
    ///
    public static func memberwise<
        T
    >(
        _ type: T.Type,
        typeNickname: String? = nil,
        _ members: [(String, Any)]
    ) -> Self {
        
        ///
        .callBlock(
            header: typeNickname ?? "\(type)",
            bracketType: .parenthesis,
            nestedBlock: .parameterList(members)
        )
    }
}

///
extension TextBlock {
    
    ///
    public static func memberwise<
        Root,
        each Member
    >(
        _ rootType: Root.Type,
         typeNickname: String? = nil,
        _ members: repeat (String, each Member)
    ) -> Self {
        
        ///
        .callBlock(
            header: typeNickname ?? "\(rootType)",
            bracketType: .parenthesis,
            nestedBlock: .parameterList(repeat each members)
        )
    }
}


// MARK: - callBlock

///
extension TextBlock {
    
    ///
    public static func callBlock(
        header: String?,
        bracketType: TextBracketType,
        nestedBlock: TextBlock
    ) -> TextBlock {
        
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
}


// MARK: - parameterList

///
extension TextBlock {
    
    ///
    public static func parameterList(
        _ keyValuePairs: (String, Any)...
    ) -> TextBlock {
        
        ///
        parameterList(keyValuePairs)
    }
    
    ///
    public static func parameterList(
        _ keyValuePairs: [(String, Any)]
    ) -> TextBlock {
        
        ///
        keyValuePairs
            .map { TextBlock($0.1).addingParameterLabel($0.0) }
            .joinedAsCommaSeparatedList
    }
}

///
extension TextBlock {
    
    ///
    public static func parameterList<
        each Value
    >(
        _ keyValuePairs: repeat (String, each Value)
    ) -> TextBlock {
        
        ///
        var textBlocks: [TextBlock] = []
        
        ///
        func appendKeyValuePair <V> (_ keyValuePair: (key: String, value: V)) {
            textBlocks
                .append(
                    TextBlock(keyValuePair.value)
                        .addingParameterLabel(keyValuePair.key)
                )
        }
        
        ///
        _ = (repeat appendKeyValuePair(each keyValuePairs))
        
        ///
        return
            textBlocks
                .joinedAsCommaSeparatedList
    }
}

// MARK: - Array<TextBlock>.joinedAsCommaSeparatedList

///
extension Array where Element == TextBlock {
    
    ///
    public var joinedAsCommaSeparatedList: TextBlock {
        self.reduce(into: TextBlock()) { result, nextTextBlock in
            if result.isNotEmpty { result.mutateLast { $0 += "," } }
            result += nextTextBlock
        }
    }
}

// MARK: - addingParameterLabel

///
extension TextBlock {
    
    ///
    public func addingParameterLabel(_ string: String) -> Self {
        self.addingParameterLabel([string])
    }
    
    ///
    public func addingParameterLabel(_ label: some TextBlockConvertible) -> Self {
        addingParameterLabel(label.asTextBlock)
    }
    
    ///
    public func addingParameterLabel(_ labelBlock: TextBlock) -> Self {
        
        ///
        let labelBlock = labelBlock.mutatingLast { $0 += ":" }
        
        ///
        if let labelLine = labelBlock.only,
           let valueLine = self.only {
            
            ///
            return [labelLine + " " + valueLine]
            
        } else {
            
            ///
            return labelBlock + self.indented()
        }
    }
}

// MARK: - indented

///
extension TextBlock {
    
    ///
    public static func indented(
        by indentationCount: Int = 1,
        _ textBlock: TextBlock
    ) -> TextBlock {
        
        ///
        textBlock.indented(by: indentationCount)
    }
}

///
extension TextBlock {
    
    ///
    public func indented(
        by indentationCount: Int = 1
    ) -> TextBlock {
        
        ///
        self.map { $0.indented(by: indentationCount) }
    }
}


// MARK: - init(_:Any)

///
extension TextBlock {
    
    ///
    public init(_ anyValue: Any) {
        
        ///
        if let textBlockConvertible = anyValue as? TextBlockConvertible {
            self = textBlockConvertible.asTextBlock
            
        } else if let stringConvertible = anyValue as? CustomStringConvertible {
            self = [stringConvertible.description]
            
        } else {
            self = ["\(anyValue)"]
        }
    }
}

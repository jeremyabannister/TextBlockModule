//
//  TextBlockConvertible_conformances.swift
//  
//
//  Created by Jeremy Bannister on 9/16/22.
//

// MARK: - Optional
extension Optional: TextBlockConvertible where Wrapped: TextBlockConvertible {
    public var asTextBlock: TextBlock {
        switch self {
        case .some (let wrapped): return wrapped.asTextBlock
        case nil:                 return ["nil"]
        }
    }
}

// MARK: - Array
extension Array: TextBlockConvertible {
    
    ///
    public var asTextBlock: TextBlock {
        .callBlock(
            header: nil,
            bracketType: .squareBracket,
            nestedBlock:
                self.map { TextBlock($0) }
                    .joinedAsCommaSeparatedList
        )
    }
}

// MARK: - Set
extension Set: TextBlockConvertible {
    public var asTextBlock: TextBlock {
        self.asArray().asTextBlock
    }
}

// MARK: - Dictionary
extension Dictionary: TextBlockConvertible {
    
    ///
    public var asTextBlock: TextBlock {
        .callBlock(
            header: nil,
            bracketType: .squareBracket,
            nestedBlock:
                self.map { key, value in
                    TextBlock(value)
                        .addingParameterLabel(TextBlock(key))
                }
                    .joinedAsCommaSeparatedList
        )
    }
}

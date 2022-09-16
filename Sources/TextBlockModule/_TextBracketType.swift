//
//  TextBracketType.swift
//  
//
//  Created by Jeremy Bannister on 9/16/22.
//

///
public struct TextBracketType:
    Codable,
    Hashable {
    
    ///
    public var opener: String
    
    ///
    public var closer: String
    
    ///
    private init (opener: String,
                  closer: String) {
        
        self.opener = opener
        self.closer = closer
    }
}

///
public extension TextBracketType {
    
    ///
    static func custom (_ opener: String,
                        _ closer: String)
        -> TextBracketType {
        
        .init(
            opener: opener,
            closer: closer
        )
    }
    
    ///
    static var parenthesis: TextBracketType {
        .custom("(", ")")
    }
    
    ///
    static var squareBracket: TextBracketType {
        .custom("[", "]")
    }
    
    ///
    static var curlyBrace: TextBracketType {
        .custom("{", "}")
    }
}

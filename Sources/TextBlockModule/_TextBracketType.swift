//
//  TextBracketType.swift
//  
//
//  Created by Jeremy Bannister on 9/16/22.
//

///
public struct TextBracketType: Codable,
                               Hashable {
    
    ///
    public var opener: String
    public var closer: String
    
    ///
    private init(
        opener: String,
        closer: String
    ) {
        
        ///
        self.opener = opener
        self.closer = closer
    }
}

///
extension TextBracketType {
    
    ///
    public static func custom(
        _ opener: String,
        _ closer: String
    ) -> TextBracketType {
        
        ///
        .init(
            opener: opener,
            closer: closer
        )
    }
    
    ///
    public static var parenthesis: TextBracketType {
        .custom("(", ")")
    }
    
    ///
    public static var squareBracket: TextBracketType {
        .custom("[", "]")
    }
    
    ///
    public static var curlyBrace: TextBracketType {
        .custom("{", "}")
    }
}

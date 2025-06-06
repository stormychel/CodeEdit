//
//  TextView+SemanticTokenRangeProvider.swift
//  CodeEdit
//
//  Created by Khan Winter on 12/19/24.
//

import Foundation
import CodeEditTextView
import LanguageServerProtocol

extension TextView: SemanticTokenMapRangeProvider {
    func nsRangeFrom(_ range: SemanticTokenRange) -> NSRange? {
        nsRangeFrom(line: range.line, char: range.char, length: range.length)
    }

    func nsRangeFrom(line: UInt32, char: UInt32, length: UInt32) -> NSRange? {
        guard let line = layoutManager.textLineForIndex(Int(line)) else {
            return nil
        }
        return NSRange(location: line.range.location + Int(char), length: Int(length))
    }
}

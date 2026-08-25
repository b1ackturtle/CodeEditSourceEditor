//
//  SourceEditorTextView.swift
//  CodeEditSourceEditor
//
//  Created by Khan Winter on 7/23/25.
//

import AppKit
import CodeEditTextView

final class SourceEditorTextView: TextView {
    var additionalCursorRects: [(NSRect, NSCursor)] = []

    override func resetCursorRects() {
        discardCursorRects()
        super.resetCursorRects()
        additionalCursorRects.forEach { (rect, cursor) in
            addCursorRect(rect, cursor: cursor)
        }
    }

    // MARK: - Logical Direction Movement
    //
    // `TextView` implements the visual direction selectors (`moveRight:`, `moveWordLeft:`,
    // `moveToRightEndOfLine:`, ...) that the arrow keys are bound to, but not their logical
    // direction counterparts. AppKit's standard key bindings send the logical selectors for
    // control and option key combinations, so those key presses are silently dropped.

    override func moveForward(_ sender: Any?) {
        moveRight(sender)
    }

    override func moveForwardAndModifySelection(_ sender: Any?) {
        moveRightAndModifySelection(sender)
    }

    override func moveBackward(_ sender: Any?) {
        moveLeft(sender)
    }

    override func moveBackwardAndModifySelection(_ sender: Any?) {
        moveLeftAndModifySelection(sender)
    }

    override func moveWordForward(_ sender: Any?) {
        moveWordRight(sender)
    }

    override func moveWordForwardAndModifySelection(_ sender: Any?) {
        moveWordRightAndModifySelection(sender)
    }

    override func moveWordBackward(_ sender: Any?) {
        moveWordLeft(sender)
    }

    override func moveWordBackwardAndModifySelection(_ sender: Any?) {
        moveWordLeftAndModifySelection(sender)
    }

    override func moveToBeginningOfLine(_ sender: Any?) {
        moveToLeftEndOfLine(sender)
    }

    override func moveToBeginningOfLineAndModifySelection(_ sender: Any?) {
        moveToLeftEndOfLineAndModifySelection(sender)
    }

    override func moveToEndOfLine(_ sender: Any?) {
        moveToRightEndOfLine(sender)
    }

    override func moveToEndOfLineAndModifySelection(_ sender: Any?) {
        moveToRightEndOfLineAndModifySelection(sender)
    }
}

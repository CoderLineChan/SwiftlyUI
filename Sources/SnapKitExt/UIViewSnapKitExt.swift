//
//  UIViewSnapKitExt.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/18.
//

import UIKit


#if canImport(SnapKit)
// MARK: - 布局
import SnapKit
public extension UIView {
    @discardableResult
    func snp(make: (_ make: ConstraintMaker) -> Void) -> Self {
        self.snp.makeConstraints { maker in
            make(maker)
        }
        return self
    }
    
    @discardableResult
    func snpRemake(make: (_ make: ConstraintMaker) -> Void) -> Self {
        self.snp.remakeConstraints { maker in
            make(maker)
        }
        return self
    }
    
    @discardableResult
    func snpUpdate(make: (_ make: ConstraintMaker) -> Void) -> Self {
        self.snp.updateConstraints { maker in
            make(maker)
        }
        return self
    }
}
#endif

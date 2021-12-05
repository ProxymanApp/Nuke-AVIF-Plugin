//
//  Data+WebPFormat.swift
//  Nuke-WebP-Plugin iOS
//
//  Created by delneg on 2021/12/05.
//  Copyright © 2021 delneg. All rights reserved.
//

import Foundation

private let fileHeaderIndex: Int = 12
private let fileHeaderPrefix = "RIFF"
private let fileHeaderSuffix = "WEBP"

// MARK: - WebP Format Testing
extension Data {

    internal var isWebPFormat: Bool {
        guard fileHeaderIndex < count else { return false }
        let endIndex = index(startIndex, offsetBy: fileHeaderIndex)
        let data = subdata(in: startIndex..<endIndex)
        let string = String(data: data, encoding: .ascii) ?? ""
        return string.hasPrefix(fileHeaderPrefix) && string.hasSuffix(fileHeaderSuffix)
    }

}

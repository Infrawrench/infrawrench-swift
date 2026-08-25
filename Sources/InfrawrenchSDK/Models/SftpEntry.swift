/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SftpEntry: Codable, Hashable, Sendable {
    /// Absolute remote path.
    public var key: String
    public var name: String
    public var size: Double
    public var lastModified: String
    public var isDirectory: Bool
    public var contentType: String?

    public init(
        key: String,
        name: String,
        size: Double,
        lastModified: String,
        isDirectory: Bool,
        contentType: String? = nil
    ) {
        self.key = key
        self.name = name
        self.size = size
        self.lastModified = lastModified
        self.isDirectory = isDirectory
        self.contentType = contentType
    }
}

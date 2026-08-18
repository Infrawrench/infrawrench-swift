/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct StorageObject: Codable, Hashable, Sendable {
    /// Full path within the bucket.
    public var key: String
    /// Last path segment — what the browser renders.
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

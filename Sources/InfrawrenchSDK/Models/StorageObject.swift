/*
 * InfrawrenchSDK v0.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.4.0).
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
    public var key: String
    public var size: Int?
    public var isFolder: Bool?
    public var lastModified: String?

    public init(
        key: String,
        size: Int? = nil,
        isFolder: Bool? = nil,
        lastModified: String? = nil
    ) {
        self.key = key
        self.size = size
        self.isFolder = isFolder
        self.lastModified = lastModified
    }
}

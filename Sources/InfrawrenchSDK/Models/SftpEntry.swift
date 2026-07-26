/*
 * InfrawrenchSDK v0.2.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.2.0).
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
    public var name: String
    public var isDir: Bool
    public var size: Int?
    public var modifiedAt: String?

    public init(
        name: String,
        isDir: Bool,
        size: Int? = nil,
        modifiedAt: String? = nil
    ) {
        self.name = name
        self.isDir = isDir
        self.size = size
        self.modifiedAt = modifiedAt
    }
}

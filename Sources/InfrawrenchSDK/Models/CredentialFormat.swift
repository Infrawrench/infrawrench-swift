/*
 * InfrawrenchSDK v0.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CredentialFormat: Codable, Hashable, Sendable {
    public var id: String
    public var label: String
    public var description: String?
    public var fileExtension: String?
    public var mimeType: String?

    public init(
        id: String,
        label: String,
        description: String? = nil,
        fileExtension: String? = nil,
        mimeType: String? = nil
    ) {
        self.id = id
        self.label = label
        self.description = description
        self.fileExtension = fileExtension
        self.mimeType = mimeType
    }
}

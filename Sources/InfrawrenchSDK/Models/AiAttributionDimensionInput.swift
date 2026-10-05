/*
 * InfrawrenchSDK v1.69.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.69.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AiAttributionDimensionInput: Codable, Hashable, Sendable {
    /// Becomes the tag key `caller:<key>` in cost reports.
    public var key: String
    public var label: String
    /// Request-metadata keys feeding the dimension, first present wins.
    public var metadataKeys: [String]

    public init(
        key: String,
        label: String,
        metadataKeys: [String]
    ) {
        self.key = key
        self.label = label
        self.metadataKeys = metadataKeys
    }
}

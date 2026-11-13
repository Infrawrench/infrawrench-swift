/*
 * InfrawrenchSDK v1.106.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.106.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ComplianceControlOwner: Codable, Hashable, Sendable {
    public var userId: String?
    public var displayName: String
    public var isLabel: Bool

    public init(
        userId: String? = nil,
        displayName: String,
        isLabel: Bool
    ) {
        self.userId = userId
        self.displayName = displayName
        self.isLabel = isLabel
    }
}

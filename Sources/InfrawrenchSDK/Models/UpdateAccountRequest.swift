/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct UpdateAccountRequest: Codable, Hashable, Sendable {
    public var displayName: String?
    /// Pass `null` to unbind, a uuid to bind, or omit the field to leave the
    /// binding unchanged.
    public var bastionId: String?

    public init(
        displayName: String? = nil,
        bastionId: String? = nil
    ) {
        self.displayName = displayName
        self.bastionId = bastionId
    }
}

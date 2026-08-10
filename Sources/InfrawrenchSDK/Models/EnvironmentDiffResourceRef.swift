/*
 * InfrawrenchSDK v1.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Null when the resource exists only on B.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct EnvironmentDiffResourceRef: Codable, Hashable, Sendable {
    /// Infrawrench resource id.
    public var resourceId: String
    public var accountId: String
    public var displayName: String
    /// Provider-native id, when known.
    public var externalId: String?

    public init(
        resourceId: String,
        accountId: String,
        displayName: String,
        externalId: String? = nil
    ) {
        self.resourceId = resourceId
        self.accountId = accountId
        self.displayName = displayName
        self.externalId = externalId
    }
}

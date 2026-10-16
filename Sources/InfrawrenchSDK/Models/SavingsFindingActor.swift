/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Null for the initial Ready and automatic changes.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct SavingsFindingActor: Codable, Hashable, Sendable {
    public var userId: String
    /// Display name or email; null when the member has left.
    public var name: String?

    public init(
        userId: String,
        name: String? = nil
    ) {
        self.userId = userId
        self.name = name
    }
}

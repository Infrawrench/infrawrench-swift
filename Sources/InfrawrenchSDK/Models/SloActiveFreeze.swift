/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The change freeze in effect, if any.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct SloActiveFreeze: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var endsAt: String?

    public init(
        id: String,
        name: String,
        endsAt: String? = nil
    ) {
        self.id = id
        self.name = name
        self.endsAt = endsAt
    }
}

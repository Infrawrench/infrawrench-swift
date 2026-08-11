/*
 * InfrawrenchSDK v1.9.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.9.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The Linear user behind the API key, from the `viewer` query.
public struct LinearVerifyResult: Codable, Hashable, Sendable {
    public var ok: Bool
    public var id: String
    public var name: String
    public var email: String?

    public init(
        ok: Bool,
        id: String,
        name: String,
        email: String? = nil
    ) {
        self.ok = ok
        self.id = id
        self.name = name
        self.email = email
    }
}

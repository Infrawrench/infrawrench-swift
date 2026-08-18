/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatSecretRequestResult: Codable, Hashable, Sendable {
    public var ok: Bool
    public var allResolved: Bool

    public init(
        ok: Bool,
        allResolved: Bool
    ) {
        self.ok = ok
        self.allResolved = allResolved
    }
}

/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AlertEmailSuppression: Codable, Hashable, Sendable {
    public var id: String
    public var email: String
    public var createdAt: String

    public init(
        id: String,
        email: String,
        createdAt: String
    ) {
        self.id = id
        self.email = email
        self.createdAt = createdAt
    }
}

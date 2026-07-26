/*
 * InfrawrenchSDK v0.2.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.2.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateBastionResponse: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var tokenPrefix: String
    /// Enrollment token in the form `iwb_<random>`. Pass to the agent container
    /// as `BASTION_TOKEN`. Returned once — not recoverable later.
    public var token: String

    public init(
        id: String,
        name: String,
        tokenPrefix: String,
        token: String
    ) {
        self.id = id
        self.name = name
        self.tokenPrefix = tokenPrefix
        self.token = token
    }
}

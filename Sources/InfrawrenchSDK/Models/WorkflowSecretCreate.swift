/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WorkflowSecretCreate: Codable, Hashable, Sendable {
    /// JavaScript dot identifier used to expose the value to workflow code, for
    /// example `API_TOKEN` or `stripe.apiKey`.
    public var name: String
    public var description: String?

    public init(
        name: String,
        description: String? = nil
    ) {
        self.name = name
        self.description = description
    }
}

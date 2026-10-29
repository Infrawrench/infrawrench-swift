/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ServicesForResources: Codable, Hashable, Sendable {
    /// Resource id to the services it belongs to; resources in none are absent.
    public var services: [String: [ServiceRef]]

    public init(
        services: [String: [ServiceRef]]
    ) {
        self.services = services
    }
}

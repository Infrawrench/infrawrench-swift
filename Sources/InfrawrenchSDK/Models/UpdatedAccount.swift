/*
 * InfrawrenchSDK v1.107.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.107.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct UpdatedAccount: Codable, Hashable, Sendable {
    public var id: String
    public var displayName: String
    public var bastionId: String?
    /// The apps this connection is for, as product ids (`infrastructure`,
    /// `costs`, `observability`, `incidents`, `security`, `delivery`,
    /// `automation`). `null` means every app the plugin offers. Collection
    /// follows it: an account connected for `costs` alone is not resource-synced,
    /// and one without `costs` has no cost data collected.
    public var products: [String]?

    public init(
        id: String,
        displayName: String,
        bastionId: String? = nil,
        products: [String]? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.bastionId = bastionId
        self.products = products
    }
}

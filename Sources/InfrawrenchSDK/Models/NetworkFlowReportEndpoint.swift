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

public struct NetworkFlowReportEndpoint: Codable, Hashable, Sendable {
    public var ref: String
    public var label: String
    public var zone: String
    public var region: String
    public var service: String
    public var resourceTypeId: String
    /// The endpoint's VPC / network id, when the provider reports it.
    public var network: String

    public init(
        ref: String,
        label: String,
        zone: String,
        region: String,
        service: String,
        resourceTypeId: String,
        network: String
    ) {
        self.ref = ref
        self.label = label
        self.zone = zone
        self.region = region
        self.service = service
        self.resourceTypeId = resourceTypeId
        self.network = network
    }
}

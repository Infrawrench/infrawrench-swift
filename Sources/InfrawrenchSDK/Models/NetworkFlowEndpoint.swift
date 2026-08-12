/*
 * InfrawrenchSDK v1.15.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.15.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowEndpoint: Codable, Hashable, Sendable {
    /// Stable endpoint identity — a provider resource id where one could be
    /// resolved, otherwise a class token (`internet`, `aws:s3`,
    /// `infrawrench:unattributed`). Never a raw IP address: addresses churn, so
    /// the same workload would be a different row every day.
    public var ref: String
    public var label: String
    public var zone: String
    public var region: String
    public var service: String
    /// Set when `ref` is a resource this organization syncs, so the row can link
    /// out.
    public var resourceTypeId: String

    public init(
        ref: String,
        label: String,
        zone: String,
        region: String,
        service: String,
        resourceTypeId: String
    ) {
        self.ref = ref
        self.label = label
        self.zone = zone
        self.region = region
        self.service = service
        self.resourceTypeId = resourceTypeId
    }
}

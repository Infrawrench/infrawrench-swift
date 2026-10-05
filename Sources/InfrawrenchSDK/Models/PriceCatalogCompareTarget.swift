/*
 * InfrawrenchSDK v1.70.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.70.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PriceCatalogCompareTarget: Codable, Hashable, Sendable {
    public var vcpus: Double?
    public var memoryGb: Double?
    public var gpuCount: Double?
    public var gpuModel: String?

    public init(
        vcpus: Double? = nil,
        memoryGb: Double? = nil,
        gpuCount: Double? = nil,
        gpuModel: String? = nil
    ) {
        self.vcpus = vcpus
        self.memoryGb = memoryGb
        self.gpuCount = gpuCount
        self.gpuModel = gpuModel
    }
}

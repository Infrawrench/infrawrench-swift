/*
 * InfrawrenchSDK v1.67.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.67.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PriceCatalogSpecs: Codable, Hashable, Sendable {
    public var vcpus: Double?
    public var memoryGb: Double?
    public var gpuCount: Double?
    public var gpuModel: String?
    public var gpuMemoryGb: Double?
    public var storageGb: Double?
    public var storageType: String?
    public var architecture: String?
    public var network: String?

    public init(
        vcpus: Double? = nil,
        memoryGb: Double? = nil,
        gpuCount: Double? = nil,
        gpuModel: String? = nil,
        gpuMemoryGb: Double? = nil,
        storageGb: Double? = nil,
        storageType: String? = nil,
        architecture: String? = nil,
        network: String? = nil
    ) {
        self.vcpus = vcpus
        self.memoryGb = memoryGb
        self.gpuCount = gpuCount
        self.gpuModel = gpuModel
        self.gpuMemoryGb = gpuMemoryGb
        self.storageGb = storageGb
        self.storageType = storageType
        self.architecture = architecture
        self.network = network
    }
}

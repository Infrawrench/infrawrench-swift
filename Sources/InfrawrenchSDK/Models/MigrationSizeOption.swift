/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MigrationSizeOption: Codable, Hashable, Sendable {
    public var id: String
    public var label: String
    public var vcpus: Double?
    public var memoryGb: Double?
    public var gpuCount: Double?
    public var gpuModel: String?
    /// One unit, per month; null if unpriced.
    public var monthly: MigrationMoney?
    /// Meets or exceeds the source's known vCPUs, memory and GPUs.
    public var meetsSpec: Bool

    public init(
        id: String,
        label: String,
        vcpus: Double? = nil,
        memoryGb: Double? = nil,
        gpuCount: Double? = nil,
        gpuModel: String? = nil,
        monthly: MigrationMoney? = nil,
        meetsSpec: Bool
    ) {
        self.id = id
        self.label = label
        self.vcpus = vcpus
        self.memoryGb = memoryGb
        self.gpuCount = gpuCount
        self.gpuModel = gpuModel
        self.monthly = monthly
        self.meetsSpec = meetsSpec
    }
}

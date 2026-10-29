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

public struct DoraSettingsUpdate: Codable, Hashable, Sendable {
    public var failureWindowHours: Int?
    public var productionEnvironments: [String]?
    public var pipelinePatterns: [String]?
    public var countFailedDeploys: Bool?
    public var includeResourceChanges: Bool?
    public var digestEnabled: Bool?

    public init(
        failureWindowHours: Int? = nil,
        productionEnvironments: [String]? = nil,
        pipelinePatterns: [String]? = nil,
        countFailedDeploys: Bool? = nil,
        includeResourceChanges: Bool? = nil,
        digestEnabled: Bool? = nil
    ) {
        self.failureWindowHours = failureWindowHours
        self.productionEnvironments = productionEnvironments
        self.pipelinePatterns = pipelinePatterns
        self.countFailedDeploys = countFailedDeploys
        self.includeResourceChanges = includeResourceChanges
        self.digestEnabled = digestEnabled
    }
}

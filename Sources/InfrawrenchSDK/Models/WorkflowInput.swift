/*
 * InfrawrenchSDK v1.103.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.103.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WorkflowInput: Codable, Hashable, Sendable {
    /// Trimmed. Omitted or blank: `Untitled workflow` on create, unchanged on
    /// update.
    public var name: String?
    public var description: String?
    public var source: String?
    public var trigger: WorkflowTrigger?
    public var metrics: [WorkflowMetricDef]?
    public var enabled: Bool?
    /// Replaces the organization secrets assigned to the workflow. Needs
    /// `secrets:read`.
    public var secretIds: [String]?
    /// Sets or rotates the git webhook signing secret; null or empty clears it.
    /// Write-only.
    public var webhookSecret: String?

    public init(
        name: String? = nil,
        description: String? = nil,
        source: String? = nil,
        trigger: WorkflowTrigger? = nil,
        metrics: [WorkflowMetricDef]? = nil,
        enabled: Bool? = nil,
        secretIds: [String]? = nil,
        webhookSecret: String? = nil
    ) {
        self.name = name
        self.description = description
        self.source = source
        self.trigger = trigger
        self.metrics = metrics
        self.enabled = enabled
        self.secretIds = secretIds
        self.webhookSecret = webhookSecret
    }
}

/*
 * InfrawrenchSDK v1.108.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.108.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Workflow: Codable, Hashable, Sendable {
    public var id: String
    /// Organization id
    public var organizationId: String
    public var name: String
    public var description: String?
    /// The workflow's TypeScript source.
    public var source: String
    public var trigger: WorkflowTrigger
    public var metricDefs: [WorkflowMetricDef]
    public var enabled: Bool
    /// The token in a git trigger's webhook URL; null for other triggers.
    public var webhookToken: String?
    /// Whether a git webhook signing secret is set. The secret itself is never
    /// returned.
    public var hasWebhookSecret: Bool
    /// The last commit a git trigger's repository watcher saw.
    public var gitLastSha: String?
    /// The budget crossing that last fired a budget trigger, so each fires once a
    /// period.
    public var budgetLastFiredKey: String?
    /// The next fire time of a cron trigger.
    public var nextRunAt: String?
    public var lastRunAt: String?
    public var createdByUserId: String?
    /// Who automated runs act for: the user who last changed the source, trigger
    /// or assigned secrets.
    public var sourceAuthorUserId: String?
    public var syncVersion: Int
    /// Always null: deleted workflows are not listed.
    public var deletedAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        organizationId: String,
        name: String,
        description: String? = nil,
        source: String,
        trigger: WorkflowTrigger,
        metricDefs: [WorkflowMetricDef],
        enabled: Bool,
        webhookToken: String? = nil,
        hasWebhookSecret: Bool,
        gitLastSha: String? = nil,
        budgetLastFiredKey: String? = nil,
        nextRunAt: String? = nil,
        lastRunAt: String? = nil,
        createdByUserId: String? = nil,
        sourceAuthorUserId: String? = nil,
        syncVersion: Int,
        deletedAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.organizationId = organizationId
        self.name = name
        self.description = description
        self.source = source
        self.trigger = trigger
        self.metricDefs = metricDefs
        self.enabled = enabled
        self.webhookToken = webhookToken
        self.hasWebhookSecret = hasWebhookSecret
        self.gitLastSha = gitLastSha
        self.budgetLastFiredKey = budgetLastFiredKey
        self.nextRunAt = nextRunAt
        self.lastRunAt = lastRunAt
        self.createdByUserId = createdByUserId
        self.sourceAuthorUserId = sourceAuthorUserId
        self.syncVersion = syncVersion
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

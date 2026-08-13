/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A workflow. The git-webhook signing secret is deliberately absent — it is
/// write-only, so a document can neither leak nor set one.
public struct OrgConfigWorkflow: Codable, Hashable, Sendable {
    public struct Metric: Codable, Hashable, Sendable {
        public var key: String
        public var label: String
        public var unit: String?
        public var type: String?

        public init(
            key: String,
            label: String,
            unit: String? = nil,
            type: String? = nil
        ) {
            self.key = key
            self.label = label
            self.unit = unit
            self.type = type
        }
    }

    /// Stable slug identifying this entity across organizations. Derived from the
    /// name on export; it is what an apply matches on, so renaming an entity
    /// while keeping its key is a rename rather than a delete-and-create.
    public var key: String
    public var name: String
    public var description: String?
    /// The workflow's TypeScript source.
    public var source: String
    public var trigger: OrgConfigWorkflowTrigger?
    public var metrics: [Metric]?
    public var enabled: Bool?

    public init(
        key: String,
        name: String,
        description: String? = nil,
        source: String,
        trigger: OrgConfigWorkflowTrigger? = nil,
        metrics: [Metric]? = nil,
        enabled: Bool? = nil
    ) {
        self.key = key
        self.name = name
        self.description = description
        self.source = source
        self.trigger = trigger
        self.metrics = metrics
        self.enabled = enabled
    }
}

/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IacReconciliationResponse: Codable, Hashable, Sendable {
    public struct Summary: Codable, Hashable, Sendable {
        public var inventoryTotal: Int
        public var managed: Int
        public var drifted: Int
        public var unmanaged: Int
        public var stateOnly: Int
        public var undiffable: Int
        public var stateResources: Int
        public var dataSourcesIgnored: Int

        public init(
            inventoryTotal: Int,
            managed: Int,
            drifted: Int,
            unmanaged: Int,
            stateOnly: Int,
            undiffable: Int,
            stateResources: Int,
            dataSourcesIgnored: Int
        ) {
            self.inventoryTotal = inventoryTotal
            self.managed = managed
            self.drifted = drifted
            self.unmanaged = unmanaged
            self.stateOnly = stateOnly
            self.undiffable = undiffable
            self.stateResources = stateResources
            self.dataSourcesIgnored = dataSourcesIgnored
        }
    }

    public struct Underivable: Codable, Hashable, Sendable {
        public var pluginId: PluginId
        public var resourceTypeId: String
        public var reason: String

        public init(
            pluginId: PluginId,
            resourceTypeId: String,
            reason: String
        ) {
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.reason = reason
        }
    }

    public var state: IacState
    public var resources: [IacReconciledResource]
    /// State entries with no inventory match — their own category.
    public var stateOnly: [IacStateOnlyResource]
    public var summary: Summary
    /// Plugin resource types whose Terraform type could not be derived from the
    /// plugin's own export mapper. Reported rather than guessed.
    public var underivable: [Underivable]

    public init(
        state: IacState,
        resources: [IacReconciledResource],
        stateOnly: [IacStateOnlyResource],
        summary: Summary,
        underivable: [Underivable]
    ) {
        self.state = state
        self.resources = resources
        self.stateOnly = stateOnly
        self.summary = summary
        self.underivable = underivable
    }
}

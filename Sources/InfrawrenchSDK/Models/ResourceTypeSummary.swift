/*
 * InfrawrenchSDK v1.107.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.107.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceTypeSummary: Codable, Hashable, Sendable {
    public struct Showcase: Codable, Hashable, Sendable {
        public var key: String
        public var label: String

        public init(
            key: String,
            label: String
        ) {
            self.key = key
            self.label = label
        }
    }

    public struct AttachTarget: Codable, Hashable, Sendable {
        public var pluginId: String
        public var resourceTypeId: String
        public var matchField: String?
        public var verb: String?

        public init(
            pluginId: String,
            resourceTypeId: String,
            matchField: String? = nil,
            verb: String? = nil
        ) {
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.matchField = matchField
            self.verb = verb
        }
    }

    public var id: String
    public var displayName: String
    public var pluralDisplayName: String
    /// What this type of resource is, in a shared vocabulary (`cpu`, `database`,
    /// ...).
    public var iconKey: String?
    /// The fields this type marked to show on its tile, read from each resource's
    /// synced fields.
    public var showcase: [Showcase]?
    public var parentTypeId: String?
    public var supportsCreate: Bool
    public var attachTargets: [AttachTarget]?
    public var isSshHost: Bool?
    public var sshTunnelAttachSource: Bool?
    public var showInSidebar: Bool?
    public var accountRoot: Bool?
    /// The type declares lifecycle start/stop actions, so its resources can carry
    /// a sleep/wake schedule.
    public var schedulable: Bool?

    public init(
        id: String,
        displayName: String,
        pluralDisplayName: String,
        iconKey: String? = nil,
        showcase: [Showcase]? = nil,
        parentTypeId: String? = nil,
        supportsCreate: Bool,
        attachTargets: [AttachTarget]? = nil,
        isSshHost: Bool? = nil,
        sshTunnelAttachSource: Bool? = nil,
        showInSidebar: Bool? = nil,
        accountRoot: Bool? = nil,
        schedulable: Bool? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.pluralDisplayName = pluralDisplayName
        self.iconKey = iconKey
        self.showcase = showcase
        self.parentTypeId = parentTypeId
        self.supportsCreate = supportsCreate
        self.attachTargets = attachTargets
        self.isSshHost = isSshHost
        self.sshTunnelAttachSource = sshTunnelAttachSource
        self.showInSidebar = showInSidebar
        self.accountRoot = accountRoot
        self.schedulable = schedulable
    }
}

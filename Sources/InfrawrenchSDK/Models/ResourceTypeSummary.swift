/*
 * InfrawrenchSDK v0.1.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.1.1).
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
    public var pluralDisplayName: String?
    public var parentTypeId: String?
    public var supportsCreate: Bool
    public var attachTargets: [AttachTarget]?
    public var isSshHost: Bool?
    public var sshTunnelAttachSource: Bool?

    public init(
        id: String,
        displayName: String,
        pluralDisplayName: String? = nil,
        parentTypeId: String? = nil,
        supportsCreate: Bool,
        attachTargets: [AttachTarget]? = nil,
        isSshHost: Bool? = nil,
        sshTunnelAttachSource: Bool? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.pluralDisplayName = pluralDisplayName
        self.parentTypeId = parentTypeId
        self.supportsCreate = supportsCreate
        self.attachTargets = attachTargets
        self.isSshHost = isSshHost
        self.sshTunnelAttachSource = sshTunnelAttachSource
    }
}

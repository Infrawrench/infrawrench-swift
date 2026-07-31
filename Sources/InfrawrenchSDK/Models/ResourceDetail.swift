/*
 * InfrawrenchSDK v0.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceDetail: Codable, Hashable, Sendable {
    public var detailSchema: JsonObject
    public var childResources: [ChildResourceRef]
    public var childTypes: [ChildTypeRef]
    public var pluginId: String
    public var pluginLogoSvg: String
    public var resourceId: ResourceId
    public var accountId: String
    public var resourceTypeId: String
    public var peerPanes: [PeerPane]
    public var peerIntegrationStubs: [PeerPaneStub]
    public var canDelete: Bool
    public var canEdit: Bool
    public var editableFields: [EditableField]
    public var credentialFormats: [CredentialFormat]
    public var hasManifestEditor: Bool
    public var hasSecretVersions: Bool
    public var resourceDisplayName: String
    public var resourceTypeLabel: String
    public var resourceFields: JsonObject
    public var hasSqlEditor: Bool
    public var hasStorageBrowser: Bool
    public var hasArtifactRegistry: Bool
    public var hasKvBrowser: Bool
    public var hasKvConsole: Bool
    public var kvDriverName: String?
    public var isMongoDb: Bool
    public var hasDockerActions: Bool
    public var hasSshTerminal: Bool
    public var hasSftpBrowser: Bool
    public var sshHost: String?
    public var sshPrivateHost: String?
    public var defaultSshUsername: String?
    public var containerId: String
    public var databaseName: String
    public var storageBucketName: String
    public var supportsMetrics: Bool

    public init(
        detailSchema: JsonObject,
        childResources: [ChildResourceRef],
        childTypes: [ChildTypeRef],
        pluginId: String,
        pluginLogoSvg: String,
        resourceId: ResourceId,
        accountId: String,
        resourceTypeId: String,
        peerPanes: [PeerPane],
        peerIntegrationStubs: [PeerPaneStub],
        canDelete: Bool,
        canEdit: Bool,
        editableFields: [EditableField],
        credentialFormats: [CredentialFormat],
        hasManifestEditor: Bool,
        hasSecretVersions: Bool,
        resourceDisplayName: String,
        resourceTypeLabel: String,
        resourceFields: JsonObject,
        hasSqlEditor: Bool,
        hasStorageBrowser: Bool,
        hasArtifactRegistry: Bool,
        hasKvBrowser: Bool,
        hasKvConsole: Bool,
        kvDriverName: String? = nil,
        isMongoDb: Bool,
        hasDockerActions: Bool,
        hasSshTerminal: Bool,
        hasSftpBrowser: Bool,
        sshHost: String? = nil,
        sshPrivateHost: String? = nil,
        defaultSshUsername: String? = nil,
        containerId: String,
        databaseName: String,
        storageBucketName: String,
        supportsMetrics: Bool
    ) {
        self.detailSchema = detailSchema
        self.childResources = childResources
        self.childTypes = childTypes
        self.pluginId = pluginId
        self.pluginLogoSvg = pluginLogoSvg
        self.resourceId = resourceId
        self.accountId = accountId
        self.resourceTypeId = resourceTypeId
        self.peerPanes = peerPanes
        self.peerIntegrationStubs = peerIntegrationStubs
        self.canDelete = canDelete
        self.canEdit = canEdit
        self.editableFields = editableFields
        self.credentialFormats = credentialFormats
        self.hasManifestEditor = hasManifestEditor
        self.hasSecretVersions = hasSecretVersions
        self.resourceDisplayName = resourceDisplayName
        self.resourceTypeLabel = resourceTypeLabel
        self.resourceFields = resourceFields
        self.hasSqlEditor = hasSqlEditor
        self.hasStorageBrowser = hasStorageBrowser
        self.hasArtifactRegistry = hasArtifactRegistry
        self.hasKvBrowser = hasKvBrowser
        self.hasKvConsole = hasKvConsole
        self.kvDriverName = kvDriverName
        self.isMongoDb = isMongoDb
        self.hasDockerActions = hasDockerActions
        self.hasSshTerminal = hasSshTerminal
        self.hasSftpBrowser = hasSftpBrowser
        self.sshHost = sshHost
        self.sshPrivateHost = sshPrivateHost
        self.defaultSshUsername = defaultSshUsername
        self.containerId = containerId
        self.databaseName = databaseName
        self.storageBucketName = storageBucketName
        self.supportsMetrics = supportsMetrics
    }
}

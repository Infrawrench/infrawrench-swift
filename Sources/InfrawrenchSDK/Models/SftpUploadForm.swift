/*
 * InfrawrenchSDK v0.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SftpUploadForm: Codable, Hashable, Sendable, MultipartEncodable {
    public var accountId: String
    public var remotePath: String
    public var file: Data
    public var sshKeyId: String?
    public var sshHost: String?
    public var sshUsername: String?

    public init(
        accountId: String,
        remotePath: String,
        file: Data,
        sshKeyId: String? = nil,
        sshHost: String? = nil,
        sshUsername: String? = nil
    ) {
        self.accountId = accountId
        self.remotePath = remotePath
        self.file = file
        self.sshKeyId = sshKeyId
        self.sshHost = sshHost
        self.sshUsername = sshUsername
    }

    public var multipartFields: [MultipartField] {
        var fields: [MultipartField] = []
        fields.append(.text("accountId", accountId.parameterValue))
        fields.append(.text("remotePath", remotePath.parameterValue))
        fields.append(.file("file", file, filename: "file"))
        if let sshKeyId { fields.append(.text("sshKeyId", sshKeyId.parameterValue)) }
        if let sshHost { fields.append(.text("sshHost", sshHost.parameterValue)) }
        if let sshUsername { fields.append(.text("sshUsername", sshUsername.parameterValue)) }
        return fields
    }
}

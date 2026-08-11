/*
 * InfrawrenchSDK v1.10.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.10.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct StorageUploadForm: Codable, Hashable, Sendable, MultipartEncodable {
    public var accountId: String
    public var bucket: String
    public var key: String
    /// Raw file bytes
    public var file: Data

    public init(
        accountId: String,
        bucket: String,
        key: String,
        file: Data
    ) {
        self.accountId = accountId
        self.bucket = bucket
        self.key = key
        self.file = file
    }

    public var multipartFields: [MultipartField] {
        var fields: [MultipartField] = []
        fields.append(.text("accountId", accountId.parameterValue))
        fields.append(.text("bucket", bucket.parameterValue))
        fields.append(.text("key", key.parameterValue))
        fields.append(.file("file", file, filename: "file"))
        return fields
    }
}

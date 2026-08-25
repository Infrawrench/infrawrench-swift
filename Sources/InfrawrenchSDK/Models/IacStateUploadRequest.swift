/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IacStateUploadRequest: Codable, Hashable, Sendable {
    public var label: String
    public var accountId: String?
    /// The state document, as text: a raw `.tfstate` (format version 4) or the
    /// output of `terraform show -json` (format_version 1.x). Limited to 8 MiB.
    public var document: String

    public init(
        label: String,
        accountId: String? = nil,
        document: String
    ) {
        self.label = label
        self.accountId = accountId
        self.document = document
    }
}

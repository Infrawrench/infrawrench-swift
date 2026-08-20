/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Something the document asked for that this organization could not satisfy — a
/// pin for a resource nobody has synced, an account name that does not exist
/// here. Not fatal: the affected card, clause or deletion is dropped and the rest
/// of the document still applies.
public struct OrgConfigUnresolved: Codable, Hashable, Sendable {
    public var section: OrgConfigSection
    public var key: String
    public var detail: String

    public init(
        section: OrgConfigSection,
        key: String,
        detail: String
    ) {
        self.section = section
        self.key = key
        self.detail = detail
    }
}

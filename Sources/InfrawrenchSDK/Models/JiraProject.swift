/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JiraProject: Codable, Hashable, Sendable {
    public var id: String
    public var key: String
    public var name: String

    public init(
        id: String,
        key: String,
        name: String
    ) {
        self.id = id
        self.key = key
        self.name = name
    }
}

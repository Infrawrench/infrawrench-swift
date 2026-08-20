/*
 * InfrawrenchSDK v1.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct StatusPageComponentInput: Codable, Hashable, Sendable {
    public var probeId: String
    public var label: String?
    public var groupName: String?

    public init(
        probeId: String,
        label: String? = nil,
        groupName: String? = nil
    ) {
        self.probeId = probeId
        self.label = label
        self.groupName = groupName
    }
}

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

public struct NetworkFlowSource: Codable, Hashable, Sendable {
    public var id: String
    /// What the flow log is attached to — a VPC id, a network.
    public var target: String
    public var region: String?
    public var destinationType: String
    public var usable: Bool
    /// Why the source cannot be read, in terms that name the fix.
    public var unusableReason: String?
    public var helpUrl: String?

    public init(
        id: String,
        target: String,
        region: String? = nil,
        destinationType: String,
        usable: Bool,
        unusableReason: String? = nil,
        helpUrl: String? = nil
    ) {
        self.id = id
        self.target = target
        self.region = region
        self.destinationType = destinationType
        self.usable = usable
        self.unusableReason = unusableReason
        self.helpUrl = helpUrl
    }
}

/*
 * InfrawrenchSDK v1.70.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.70.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RemediationCommand: Codable, Hashable, Sendable {
    /// CLI the command is written for: aws-cli, gcloud, az, doctl, hcloud, scw,
    /// linode-cli, oci, kubectl, terraform, confluent, atlas, gh, twilio,
    /// snowflake-sql, curl, or a plugin's own.
    public var tool: String
    /// The command line, values already shell-quoted.
    public var command: String
    /// What the command does.
    public var description: String
    /// True when it deletes data or releases something that cannot be got back.
    public var destructive: Bool
    public var placeholders: [RemediationPlaceholder]?

    public init(
        tool: String,
        command: String,
        description: String,
        destructive: Bool,
        placeholders: [RemediationPlaceholder]? = nil
    ) {
        self.tool = tool
        self.command = command
        self.description = description
        self.destructive = destructive
        self.placeholders = placeholders
    }
}

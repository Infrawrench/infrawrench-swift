/*
 * InfrawrenchSDK v1.100.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.100.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TunnelSshAttachResult: Codable, Hashable, Sendable {
    public struct Step: Codable, Hashable, Sendable {
        public var label: String
        public var ok: Bool
        /// The failure, or the end of the install log.
        public var detail: String?

        public init(
            label: String,
            ok: Bool,
            detail: String? = nil
        ) {
            self.label = label
            self.ok = ok
            self.detail = detail
        }
    }

    public var steps: [Step]
    /// How to reach the service once the setup finished: an `ssh` or
    /// `cloudflared` command, or the URL.
    public var connectCommand: String?

    public init(
        steps: [Step],
        connectCommand: String? = nil
    ) {
        self.steps = steps
        self.connectCommand = connectCommand
    }
}

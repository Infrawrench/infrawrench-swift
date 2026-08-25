/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SignSshKeyRequest: Codable, Hashable, Sendable {
    public struct Context: Codable, Hashable, Sendable {
        public var host: String?
        public var username: String?

        public init(
            host: String? = nil,
            username: String? = nil
        ) {
            self.host = host
            self.username = username
        }
    }

    /// The exact bytes SSH wants signed (a publickey-auth challenge),
    /// base64-encoded.
    public var data: String
    public var algorithm: SshSignAlgorithm
    /// Recorded in the audit log entry for this signature.
    public var context: Context?

    public init(
        data: String,
        algorithm: SshSignAlgorithm,
        context: Context? = nil
    ) {
        self.data = data
        self.algorithm = algorithm
        self.context = context
    }
}

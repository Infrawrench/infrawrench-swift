/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshExecResponse: Codable, Hashable, Sendable {
    public var stdout: String
    public var stderr: String?
    public var code: Int

    public init(
        stdout: String,
        stderr: String? = nil,
        code: Int
    ) {
        self.stdout = stdout
        self.stderr = stderr
        self.code = code
    }
}

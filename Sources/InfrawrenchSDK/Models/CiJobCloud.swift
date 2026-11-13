/*
 * InfrawrenchSDK v1.108.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.108.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A cloud job's `cloud:` block and what ran it.
public struct CiJobCloud: Codable, Hashable, Sendable {
    public var provider: String
    public var kind: String
    public var machine: String?
    public var region: String?
    /// What ran it, e.g. `aws ec2 i-0abc (eu-west-1)`.
    public var executor: String?

    public init(
        provider: String,
        kind: String,
        machine: String? = nil,
        region: String? = nil,
        executor: String? = nil
    ) {
        self.provider = provider
        self.kind = kind
        self.machine = machine
        self.region = region
        self.executor = executor
    }
}

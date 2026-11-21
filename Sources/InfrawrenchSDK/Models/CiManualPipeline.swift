/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiManualPipeline: Codable, Hashable, Sendable {
    /// The pipeline file, under `.infrawrench/ci/`.
    public var file: String
    public var name: String
    public var inputs: [CiInput]

    public init(
        file: String,
        name: String,
        inputs: [CiInput]
    ) {
        self.file = file
        self.name = name
        self.inputs = inputs
    }
}

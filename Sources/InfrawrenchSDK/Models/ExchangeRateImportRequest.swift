/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExchangeRateImportRequest: Codable, Hashable, Sendable {
    /// The file's text, with a header row. Columns (matched by name, case and
    /// punctuation insensitive): `from`, `to`, `rate`, and either
    /// `effective_from` (+ optional `effective_to`) or `billing_period`
    /// (`YYYY-MM`, shorthand for that month's first and last day). Comma,
    /// semicolon, tab or pipe delimited. At most 2,000 rows.
    public var csv: String
    /// Classify every row and write nothing. The preview the settings page shows.
    public var dryRun: Bool?
    /// Write the valid rows even when some rows are invalid. Without it an upload
    /// with any invalid row writes nothing.
    public var skipInvalid: Bool?

    public init(
        csv: String,
        dryRun: Bool? = nil,
        skipInvalid: Bool? = nil
    ) {
        self.csv = csv
        self.dryRun = dryRun
        self.skipInvalid = skipInvalid
    }
}

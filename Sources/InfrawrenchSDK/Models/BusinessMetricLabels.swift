/*
 * InfrawrenchSDK v1.69.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.69.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A value's labels, e.g. `{ "customer": "acme", "plan": "pro" }`. At most 8,
/// keys are slugs, values up to 200 characters. Rows partition the metric: a
/// day's total is the sum of every row for it, so report a breakdown or a total,
/// never both. The same day with the same labels restates; different labels are a
/// different row.
public typealias BusinessMetricLabels = [String: String]

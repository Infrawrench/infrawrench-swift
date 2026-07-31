# InfrawrenchSDK

Generated Swift client for the Infrawrench API (API version `0.24.0`).

**Do not edit this package by hand** — it is regenerated from `openapi.json` and
is not checked into the repository. Run
`pnpm --filter @infrawrench/web generate:sdk` to rebuild it; the generator lives
in [`app/packages/web/scripts/sdk`](https://github.com/Infrawrench/Infrawrench/tree/main/app/packages/web/scripts/sdk).

## Version

SwiftPM takes a package's version from its Git tag, so `Package.swift` has
nowhere to record which API this code matches. It is recorded in the code
instead:

```swift
InfrawrenchSDKInfo.apiVersion      // "0.24.0"
InfrawrenchSDKInfo.defaultBaseURL  // "https://app.infrawrench.com"
```

## Usage

```swift
import InfrawrenchSDK

let client = APIV1Client(
    apiKey: ProcessInfo.processInfo.environment["INFRAWRENCH_API_KEY"],
    orgId: ProcessInfo.processInfo.environment["INFRAWRENCH_ORG_ID"]
)

do {
    let accounts = try await client.accounts.list()
} catch let error as ApiError {
    print(error.status, error.code ?? "-", error.body)
} catch let error as ClientError {
    print(error)  // a missing org id, an unbuildable URL — nothing left the process
}
```

Calls are namespaced to mirror the URL structure, so `POST /api/org/{orgId}/accounts/{id}/sync`
is `client.accounts.sync(id:)`. Set `orgId` once on the client and every
org-scoped call can omit it; pass `orgId` to an individual call to override it.

Every method takes a trailing `RequestOptions` (`headers`, `timeout`).
Non-2xx responses throw `ApiError`, which carries `status`, the parsed
`body`, and the machine-readable `code` when the API sends one.

## Notes on the generated types

- **Free-form JSON** — `additionalProperties: true` objects and untyped
  properties are `JSONValue`, an enum covering the whole JSON grammar, with
  subscripts: `error.body["details"]?["field"]?.stringValue`.
- **String enums** carry an `unrecognized(String)` case. A value the server
  adds after this package was generated decodes into it rather than throwing, so
  a new resource type does not break an old client. `allKnownCases` lists the
  values the spec declared.
- **`allOf`** is flattened into a single struct, because Swift has no
  intersection type.
- **Multi-shape `anyOf`** becomes an enum with one case per branch and an
  `other(JSONValue)` catch-all.
- **Nullable properties** are Swift optionals, and `nil` is omitted from
  request bodies rather than sent as `null`.
- **Dates** stay `String`. The spec's `date-time` values are RFC 3339, but
  decoding them into `Date` would impose one date strategy on every property in
  the package, including the many that are not dates.

## Platforms

macOS 12+, iOS 15+, tvOS 15+, watchOS 8+, and Linux. On Linux the async
`URLSession` API lives in `FoundationNetworking`, which the transport imports
conditionally and falls back behind. No dependencies — Foundation only.

## Scope

This package covers the published API surface only. Operations marked
`x-internal` in the spec — the admin surface, webhook receivers, desktop sync,
push registration and the browser auth redirects — are not generated.

## Testing against it

```
swift run infrawrench-sdk-smoke
```

runs a generated smoke suite that drives the client through a stubbed
`URLProtocol`, without a network. It is an executable rather than a
`.testTarget` because XCTest is missing from a Command Line Tools-only macOS
toolchain and swift-testing would be a dependency — and this package has none.

The same technique works for testing your own code: build a `URLSession` from a
configuration whose `protocolClasses` is your stub, and hand it to
`ClientOptions(session:)`.

## License

MIT — see [`LICENSE`](./LICENSE). Copyright (c) 2026 Infrawrench LLC.

Note that this client is more permissively licensed than the service it talks
to: the Infrawrench source is BUSL-1.1, but the generated clients are MIT so you
can link one into your own software without inheriting those terms.

Keywords: infrawrench, sdk, api-client, openapi, infrastructure, cloud, devops.
Author: Infrawrench LLC <astrid@infrawrench.com>, with Astrid Gealer.
Homepage: <https://infrawrench.com/docs/team-and-billing/client-sdks>
Issues: <https://github.com/Infrawrench/Infrawrench/issues>

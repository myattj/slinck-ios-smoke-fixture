# Slinck demo fast path

Use this sequence for a short, credible remote-demo flow with the fewest
avoidable gateway queue waits.

## Before the demo

1. Finish all app changes, commit them, and push `main` once. Record the full
   SHA that contains the app change. Do not make documentation-only commits
   during the demo: each newer commit needs its own pinned source session.
2. Confirm the app is self-contained so the governed session can keep
   `network: "none"`, `source_credentials: "none"`, and `signing: "none"`.
3. Obtain the live `tools/list` schema once at the start of the demo. Create a
   single session using the approved GitHub source, `refs/heads/main`, that
   full SHA, and `workspace: { mode: "persistent" }`.
4. Request private artifacts from the outset. The preview gateway scope rejects
   project-visible artifacts, so `artifact_visibility: "private"` prevents a
   failed session-creation round trip.

## Fast remote flow

Use one active session for every step below; do not create a new session between
build, boot, install, launch, screenshot, or an explicitly requested UI action.

1. `build_app` once, against the pinned SHA.
2. Poll only the returned `tool_call_id` until it is terminal. A `queued` state
   is normal queueing, not a build result.
3. `boot_simulator` once. Reuse that simulator for the rest of the demo; avoid
   `fresh: true` on repeat runs unless a clean simulator is specifically needed.
4. Install the build-products artifact, then launch the app.
5. Capture a screenshot after launch. In the current preview scope, screenshot
   is available while `inspect` may be denied; use screenshot as the baseline
   remote UI proof and report an `inspect` denial as a gateway-policy issue.

## Interaction and validation

- Do not run XCTest unless the user explicitly asks for it. It adds another
  remote queue wait and is not part of the default product demo.
- Do not attempt `inspect` as a required step. It can be tried only when its
  result would be useful, and a scope denial should not block the completed
  build/install/launch/screenshot flow.
- Do not tap a button, type, or swipe until the user explicitly names that
  action in the current conversation. Before a requested interaction, report
  which controls are known from the app or available through an allowed UI
  snapshot.
- For a second visual pass on the same build, relaunch or screenshot in the
  existing session; do not rebuild or re-boot first.

## Gateway reliability rules

- Use the direct governed gateway call when the native MCP wrapper returns
  `Invalid tools/call parameters`; preserve the same source and access policy.
- Treat `unsandboxed_gateway_preview_scope_denied` as a policy result, not an
  app failure. Apply only the documented compatible adjustment (private
  artifacts); do not broaden source, network, credential, signing, secret, or
  isolation permissions.
- Keep the persistent workspace and the current session alive by reusing them
  for real work. Do not send artificial keepalive calls: they add queue pressure
  without extending a documented session lifetime. If a session expires, create
  one replacement session pinned to the same already-pushed SHA and resume from
  the latest successful artifact.

## What to say during the demo

Keep the narration short and precise:

> “This session is pinned to commit `<SHA>` from the approved GitHub source,
> with no network, credentials, signing, or secrets. The remote build, install,
> launch, and screenshot are all durable gateway operations.”

Report only terminal results as success. Include the durable session or tool-call
ID for a failure, then state the next safe action.

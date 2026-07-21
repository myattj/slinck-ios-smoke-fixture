# Slinck iOS Smoke Sample

Tiny iOS fixture for the local worker MVP and future:

```sh
slinck run ios-smoke --repo examples/ios-smoke-sample --project SlinckSmokeSample.xcodeproj --scheme SlinckSmokeSample --json
```

The worker E2E harness builds `slinck`, runs this sample, and validates the
result dossier:

```sh
worker/Scripts/run-ios-smoke-e2e.sh
SLINCK_E2E_FAILURES=1 worker/Scripts/run-ios-smoke-e2e.sh
```

The app target is intentionally small and provider-agnostic. It gives the worker
a stable app bundle, one first screen, unit tests, UI tests, and accessibility
identifiers that are safe to use for launch, screenshot, and the worker-owned
accessibility-tree probe.

## Project Facts

- Project: `SlinckSmokeSample.xcodeproj`
- Scheme: `SlinckSmokeSample`
- App target: `SlinckSmokeSample`
- Unit test target: `SlinckSmokeSampleTests`
- UI test target: `SlinckSmokeSampleUITests`
- Bundle identifier: `com.slinck.IOSSmokeSample`
- Minimum deployment target: iOS 17.0

Stable accessibility identifiers on the first screen:

- `smoke.title`
- `smoke.subtitle`
- `smoke.status.build`
- `smoke.status.artifacts`
- `smoke.ready.button`
- `smoke.validation.message`
- `smoke.validation.button`
- `qualification.input`
- `qualification.scroll`

## Local Commands

From this directory:

```sh
xcodebuild -list -project SlinckSmokeSample.xcodeproj
```

Build for any available iOS simulator:

```sh
xcodebuild build \
  -project SlinckSmokeSample.xcodeproj \
  -scheme SlinckSmokeSample \
  -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath .build/DerivedData \
  CODE_SIGNING_ALLOWED=NO \
  COMPILER_INDEX_STORE_ENABLE=NO
```

Run the unit and UI smoke tests. This command uses an iPhone 16 simulator on
iOS 26.0; replace the destination with any device and runtime from
`xcrun simctl list devices available` if your Xcode install does not include
that pair.

```sh
xcodebuild test \
  -project SlinckSmokeSample.xcodeproj \
  -scheme SlinckSmokeSample \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 16,OS=26.0' \
  -derivedDataPath .build/DerivedData \
  -resultBundlePath .build/results/SlinckSmokeSample.xcresult \
  -resultBundleVersion 3 \
  CODE_SIGNING_ALLOWED=NO \
  COMPILER_INDEX_STORE_ENABLE=NO
```

Build only, then install and launch the app manually:

```sh
xcodebuild build \
  -project SlinckSmokeSample.xcodeproj \
  -scheme SlinckSmokeSample \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 16,OS=26.0' \
  -derivedDataPath .build/DerivedData \
  CODE_SIGNING_ALLOWED=NO \
  COMPILER_INDEX_STORE_ENABLE=NO
```

```sh
APP_PATH=".build/DerivedData/Build/Products/Debug-iphonesimulator/SlinckSmokeSample.app"
UDID="$(xcrun simctl list devices available | awk -F '[()]' '/^[[:space:]]+iPhone 16 \\(/ { print $2; exit }')"
xcrun simctl boot "$UDID" || true
xcrun simctl bootstatus "$UDID" -b
xcrun simctl install "$UDID" "$APP_PATH"
xcrun simctl launch "$UDID" com.slinck.IOSSmokeSample
xcrun simctl io "$UDID" screenshot .build/post-launch.png
```

## Worker Notes

The future worker should be able to resolve the built app with
`PRODUCT_BUNDLE_IDENTIFIER`, `TARGET_BUILD_DIR`, and `WRAPPER_NAME` from
`xcodebuild -showBuildSettings -json`. The UI test target is present only as a
fixture sanity check; the worker-owned accessibility probe should not depend on
this app adding UI tests.
The worker probe runs from `worker/Sources/SlinckWorkerCore/Resources` and
targets the installed app by bundle identifier, so this fixture's UI test target
is not part of accessibility capture.

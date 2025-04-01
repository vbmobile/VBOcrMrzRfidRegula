// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VBOcrMrzRfidRegula",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "VBOcrMrzRfidRegula",
            targets: ["VBOcrMrzRfidRegulaWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", .upToNextMinor(from: "7.5.0")),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", .upToNextMinor(from: "7.5.0")),
        .package(url: "https://github.com/vbmobile/MobileIdSDKiOS", .upToNextMinor(from: "8.0.0"))
    ],
    targets: [
        .binaryTarget(
            name: "VBOcrMrzRfidRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/MobileIdSDKiOS/VBOcrMrzRfidRegula/VBOcrMrzRfidRegula-1.0.0.zip",
            checksum: "597a67e3666f9e79f8f67b25864e84ac2707f4f34ebb99b5e4d8ab51875c394d"
        ),
        .target(
            name: "VBOcrMrzRfidRegulaWrapper",
            dependencies: [
                .target(name: "VBOcrMrzRfidRegula"),
                .product(name: "OCRRFID", package: "DocumentReaderOCRRFID-Swift-Package"),
                .product(name: "DocumentReader", package: "DocumentReader-Swift-Package"),
                .product(name: "MobileIdSDKiOS", package: "MobileIdSDKiOS")
            ],
            path: "Sources",
            sources: ["Dummy.swift"]
        )
    ],
    swiftLanguageVersions: [.v5]
)

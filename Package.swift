// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VBOcrMrzRfidRegula",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "VBOcrMrzRfidRegula",
            type: .dynamic,
            targets: ["VBOcrMrzRfidRegulaWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", .upToNextMinor(from: "7.5.0")),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", .upToNextMinor(from: "7.5.0")),
        .package(url: "https://github.com/vbmobile/MobileIdSDKiOS", .upToNextMinor(from: "8.1.0"))
    ],
    targets: [
        .binaryTarget(
            name: "VBOcrMrzRfidRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/MobileIdSDKiOS/VBOcrMrzRfidRegula/VBOcrMrzRfidRegula-1.1.0.zip",
            checksum: "ac99760fd4474e584c096db3aa3525ed1746b541c7a70056593f71a44b3825ca"
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

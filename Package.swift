// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libopenmpt-swift",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "libopenmpt",
            targets: ["libopenmpt"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "libopenmpt",
            path: "Sources/openmpt",
            exclude: [
                // i wish i could just specify *.cpp to avoid including these
                "libopenmpt/Doxyfile",
                "libopenmpt/bindings",
                "libopenmpt/in_openmpt",
                "libopenmpt/xmp-openmpt",
                "libopenmpt/libopenmpt_test",
                "libopenmpt/plugin-common",
                "libopenmpt/libopenmpt.pc.in",
                "libopenmpt/libopenmpt_version.mk",
                // windows resource script cruft,
                "libopenmpt/libopenmpt.ico",
                "libopenmpt/libopenmpt_version.rc",
                "libopenmpt/plugin-common/libopenmpt_plugin_gui.rc"
            ],
            sources: [
                "common",
                "sounddsp",
                "soundlib",
                "soundlib/plugins",
                "soundlib/plugins/dmo",
                "libopenmpt",
            ],
            // publicHeadersPath: "",
            cxxSettings: [
                .define("LIBOPENMPT_BUILD"),
                .headerSearchPath(""),
                .headerSearchPath("common"),
                .headerSearchPath("src")
            ])
    ],
    cxxLanguageStandard: .cxx17
)

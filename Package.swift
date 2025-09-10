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
            // openmpt submodule is in a subdir so we can have a custom include path
            path: "Sources/openmpt",
            exclude: [
                // i wish i could just specify *.cpp to avoid including these
                "openmpt/libopenmpt/Doxyfile",
                "openmpt/libopenmpt/bindings",
                "openmpt/libopenmpt/in_openmpt",
                "openmpt/libopenmpt/xmp-openmpt",
                "openmpt/libopenmpt/libopenmpt_test",
                "openmpt/libopenmpt/plugin-common",
                "openmpt/libopenmpt/libopenmpt.pc.in",
                "openmpt/libopenmpt/libopenmpt_version.mk",
                // windows resource script cruft,
                "openmpt/libopenmpt/libopenmpt.ico",
                "openmpt/libopenmpt/libopenmpt_version.rc",
                "openmpt/libopenmpt/plugin-common/libopenmpt_plugin_gui.rc"
            ],
            sources: [
                "openmpt/common",
                "openmpt/sounddsp",
                "openmpt/soundlib",
                "openmpt/soundlib/plugins",
                "openmpt/soundlib/plugins/dmo",
                "openmpt/libopenmpt",
            ],
            cxxSettings: [
                .define("LIBOPENMPT_BUILD"),
                .headerSearchPath("openmpt/"),
                .headerSearchPath("openmpt/common"),
                .headerSearchPath("openmpt/src"),
            ])
    ],
    cxxLanguageStandard: .cxx17
)

// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AutoPlaylist",
    platforms: [.iOS("17.0")],
    products: [
        .library(name: "AutoPlaylist", targets: ["AutoPlaylist"])
    ],
    targets: [
        .target(name: "AutoPlaylist", path: "")
    ]
)

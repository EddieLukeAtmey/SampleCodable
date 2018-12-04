// swift-tools-version:4.0

import PackageDescription

let package = Package(
	name: "LocalPerfectShop",
	products: [
		.executable(name: "LocalPerfectShop", targets: ["LocalPerfectShop"])
	],
	dependencies: [
		.package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0"),
	],
	targets: [
		.target(name: "LocalPerfectShop", dependencies: ["PerfectHTTPServer"])
	]
)

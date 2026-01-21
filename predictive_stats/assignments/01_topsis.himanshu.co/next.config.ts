import type { NextConfig } from "next";

const nextConfig: NextConfig = {
	// disable type checking for faster builds
	typescript: {
		ignoreBuildErrors: true,
	},
};

export default nextConfig;

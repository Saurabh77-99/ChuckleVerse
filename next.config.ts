import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
    domains: ['ityuuqrpuiepokvlfoyt.supabase.co'],
    // domains: ['dxivthjewtqwntahbidn.supabase.co'],
  },
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
};

export default nextConfig;

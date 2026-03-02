class Bidradar < Formula
  desc "CLI tool for tracking real estate auction offers from CEF"
  homepage "https://github.com/praser/bidradar"
  url "https://github.com/praser/bidradar/releases/download/v0.6.5/bidradar-0.6.5.tar.gz"
  sha256 "1f8bc2d16d4880493ae810b79b0edb183d224e68b31fc0ba15edb21b3c5dc000"
  license "ISC"

  depends_on "node@22"

  def install
    libexec.install "dist/bin/index.js"
    (bin/"bidradar").write_env_script libexec/"index.js",
      PATH: "#{Formula["node@22"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bidradar --version")
  end
end

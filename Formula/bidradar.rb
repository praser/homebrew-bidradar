class Bidradar < Formula
  desc "CLI tool for tracking real estate auction offers from CEF"
  homepage "https://github.com/praser/bidradar"
  url "https://github.com/praser/bidradar/releases/download/v0.6.1/bidradar-0.6.1.tar.gz"
  sha256 "e9c9afcc68201bc3e2cf626944f23115b78fe9382cb6fada0eae76474fec7170"
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

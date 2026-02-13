class Bidradar < Formula
  desc "CLI tool for tracking real estate auction offers from CEF"
  homepage "https://github.com/praser/bidradar"
  url "https://github.com/praser/bidradar/releases/download/v0.1.0/bidradar-0.1.0.tar.gz"
  sha256 "a35318cac58a466f47dd61b412f1e0f9c4d1e6fb77b00882625f5726edfaa27d"
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

class Bidradar < Formula
  desc "CLI tool for tracking real estate auction offers from CEF"
  homepage "https://github.com/praser/bidradar"
  url "https://github.com/praser/bidradar/releases/download/v0.6.6/bidradar-0.6.6.tar.gz"
  sha256 "dc7c62c36fb4da12417953048690e97279570ce49aeace18e62dc35181e39d7b"
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

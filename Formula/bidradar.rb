class Bidradar < Formula
  desc "CLI tool for tracking real estate auction offers from CEF"
  homepage "https://github.com/praser/bidradar"
  url "https://github.com/praser/bidradar/releases/download/v0.6.8/bidradar-0.6.8.tar.gz"
  sha256 "cd51299f9c061b392ebae571a62b4b465648af7236aba7ab790971f440796b75"
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

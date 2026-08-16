class Tokenbot < Formula
  desc "TokenBot user-facing CLI — strategies, copiers, exchanges, balances, webhooks"
  homepage "https://tokenbot.com"
  url "https://registry.npmjs.org/tokenbot/-/tokenbot-0.1.0-beta.6.tgz"
  sha256 "8a15841653ee8e7ae0abc69e09ac9323abadf5c17ff425f05fcb54a6e19b7bc1"
  license "MIT"

  # tokenbot CLI requires Node 22+ at runtime.
  # Using node@22 specifically to avoid auto-upgrade surprises; can broaden later.
  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink Dir["#{libexec}/bin/tokenbot"]
  end

  test do
    output = shell_output("#{bin}/tokenbot --version 2>&1", 0)
    assert_match(/\d+\.\d+\.\d+/, output)
  end
end

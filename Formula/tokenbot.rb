class Tokenbot < Formula
  desc "TokenBot user-facing CLI — strategies, copiers, exchanges, balances, webhooks"
  homepage "https://tokenbot.com"
  url "https://registry.npmjs.org/tokenbot/-/tokenbot-0.1.0-beta.3.tgz"
  sha256 "4a426d639983b51adcf035d0741a3259cfe625d80e2f75a7243f77aa5e08f017"
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

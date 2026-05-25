class Tokenbot < Formula
  desc "TokenBot user-facing CLI — strategies, copiers, exchanges, balances, webhooks"
  homepage "https://tokenbot.org"
  url "https://registry.npmjs.org/tokenbot/-/tokenbot-0.1.0-beta.1.tgz"
  sha256 "b9db71a6e8a20f12133f93ccb475aa9f9b2331632cf4ac34c3a716cc9e879d5c"
  license "MIT"

  # tokenbot CLI requires Node 22+ at runtime.
  # Using node@22 specifically to avoid auto-upgrade surprises; can broaden later.
  depends_on "node@22"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/tokenbot"]
  end

  test do
    output = shell_output("#{bin}/tokenbot --version 2>&1", 0)
    assert_match(/\d+\.\d+\.\d+/, output)
  end
end

class Tokenbot < Formula
  desc "TokenBot user-facing CLI — strategies, copiers, exchanges, balances, webhooks"
  homepage "https://tokenbot.org"
  url "https://registry.npmjs.org/tokenbot/-/tokenbot-0.1.0-beta.2.tgz"
  sha256 "33a565193b0f4f161c5239c3c5e597e51286cbf14a152a7c887c768e9665999c"
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

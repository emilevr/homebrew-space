class Space < Formula
  desc "Analyze and clean your disk space (powered by Rust)"
  homepage "https://github.com/emilevr/space"
  url "https://github.com/emilevr/space/archive/refs/tags/2.0.0.tar.gz"
  sha256 "d38ecb4a5cfbed72a5c1b426b1c990e492f5edc11b9ae6e2681a7a5425ec4b2b"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/emilevr/homebrew-space/releases/download/space-2.0.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d0607201e8b202938bd4b332282c320a3c737435d3785d36df673822865995e3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4b2a263ca90416cfe0a604d4c9e5b483fd7c6dae95e92965ce167b28c98ee535"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Space, the final frontier!", shell_output("#{bin}/space --help")
  end
end

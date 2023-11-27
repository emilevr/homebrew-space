class Space < Formula
  desc "Analyze and clean your disk space (powered by Rust)"
  homepage "https://github.com/emilevr/space"
  url "https://github.com/emilevr/space/archive/refs/tags/1.0.1.tar.gz"
  sha256 "e9b4e61f962ab9f99d90f3498eecf55e6db9003f5ed8d5887f2fe0929cc3d0ab"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/emilevr/homebrew-space/releases/download/space-1.0.1"
    sha256 cellar: :any_skip_relocation, ventura:      "0418ede6846987a88e40c946f6e2dc42c0df7e1a09c3c8b16066280302378d93"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "18069c9f226cbe9b2a4a9aa1ea58fcbe77ca41ac27e6ab6b5c33f1fffab8faec"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Space, the final frontier!", shell_output("#{bin}/space --help")
  end
end

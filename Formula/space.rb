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

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Space, the final frontier!", shell_output("#{bin}/space --help")
  end
end

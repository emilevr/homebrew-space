class Space < Formula
  desc "A fast disk space analyzer and cleaner powered by Rust!"
  homepage "https://github.com/emilevr/space"
  url "https://github.com/emilevr/space/archive/refs/tags/0.1.6.tar.gz"
  sha256 "df839731ffd6904df06c347e56f5b6052cbe0f42a0746939bcf93da90f702531"
  license "MIT"
  revision 1

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

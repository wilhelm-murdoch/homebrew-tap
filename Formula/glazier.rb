# The release workflow fills the @...@ placeholders with packaging/render.sh and pushes the result to the tap.
class Glazier < Formula
  desc "Declarative tmux workspaces from HCL profiles"
  homepage "https://github.com/wilhelm-murdoch/glazier"
  version "0.2.4"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-darwin-arm64.zip"
      sha256 "42a101748681d253f21fc9c49bc971d3de6735d4f38148beb1d01ce10b255b5c"
    end

    on_intel do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-darwin-amd64.zip"
      sha256 "8e7280dffedd5594bd7a472b848216709730105b2ce1f91e23270c50dac94960"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-linux-arm64.zip"
      sha256 "9ce0aedd20755f4ae880a6bcd271a39ad488fc5a2625dfa283e09ce018b181f6"
    end

    on_intel do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-linux-amd64.zip"
      sha256 "b32e8c1e824b603c8149a6bf551140e76bfc4cd1517ec7e177e9daea0b2c835f"
    end
  end

  def install
    bin.install "glaze"
  end

  test do
    assert_match "Version: v#{version},", shell_output("#{bin}/glaze --version")
  end
end

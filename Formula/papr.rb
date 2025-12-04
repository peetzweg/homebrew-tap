class Papr < Formula
  include Language::Python::Virtualenv

  desc "Command line tool to generate empty calendar templates to print"
  homepage "https://peet.sh/"
  url "https://github.com/peetzweg/papr/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2d39b9a75612487a119a3926a96a2182d8bea7d9e9327c8b67e70970d1c52cc7"
  license "MIT"

  depends_on "pygobject3"
  depends_on "python@3.12"

  resource "pycairo" do
    url "https://files.pythonhosted.org/packages/64/31/a7f1dfd52fc09898faitde97f9d01ae8d57d6d320350a1be7346b7b8b619/pycairo-1.29.0.tar.gz"
    sha256 "a11b999ce55b798dbf13516ab038e0ce8b6ec299b208d7c4e767a6f7e68e8430"
  end

  resource "pygobject" do
    url "https://files.pythonhosted.org/packages/4a/49/05e73804c9c52cf82d10d9acb1e8540a0e3e0d33f618bb218e1c4cc4ddca/pygobject-3.54.5.tar.gz"
    sha256 "5ba0c8345c4c03cd5c8ca681df3dc7f7a20ba9c5e82b42382ed5a4cdb1f1afbb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"papr", "--help"
  end
end

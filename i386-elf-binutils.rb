require 'formula'

class I386ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz'
  sha256 '26253bf0f360ceeba1d9ab6965c57c6a48a01a8343382130d1ed47c468a3094f'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/opt/homebrew/bin/gcc-13'
    ENV['CXX'] = '/opt/homebrew/bin/g++-13'
    ENV['CPP'] = '/opt/homebrew/bin/cpp-13'
    ENV['LD'] = '/opt/homebrew/bin/gcc-13'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i386-elf','--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
    end
  end

end

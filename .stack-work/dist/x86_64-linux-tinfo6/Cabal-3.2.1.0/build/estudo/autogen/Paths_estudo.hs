{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_estudo (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/japan/Desktop/haskell-estudo/merda/estudo/.stack-work/install/x86_64-linux-tinfo6/5bd90cba0a527348c2a5e76b2cf00274dbd1f7721e239d81fe72b373a73011b7/8.10.7/bin"
libdir     = "/home/japan/Desktop/haskell-estudo/merda/estudo/.stack-work/install/x86_64-linux-tinfo6/5bd90cba0a527348c2a5e76b2cf00274dbd1f7721e239d81fe72b373a73011b7/8.10.7/lib/x86_64-linux-ghc-8.10.7/estudo-0.1.0.0-KZSNVstMlo8HycpbBM6Bkd-estudo"
dynlibdir  = "/home/japan/Desktop/haskell-estudo/merda/estudo/.stack-work/install/x86_64-linux-tinfo6/5bd90cba0a527348c2a5e76b2cf00274dbd1f7721e239d81fe72b373a73011b7/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/japan/Desktop/haskell-estudo/merda/estudo/.stack-work/install/x86_64-linux-tinfo6/5bd90cba0a527348c2a5e76b2cf00274dbd1f7721e239d81fe72b373a73011b7/8.10.7/share/x86_64-linux-ghc-8.10.7/estudo-0.1.0.0"
libexecdir = "/home/japan/Desktop/haskell-estudo/merda/estudo/.stack-work/install/x86_64-linux-tinfo6/5bd90cba0a527348c2a5e76b2cf00274dbd1f7721e239d81fe72b373a73011b7/8.10.7/libexec/x86_64-linux-ghc-8.10.7/estudo-0.1.0.0"
sysconfdir = "/home/japan/Desktop/haskell-estudo/merda/estudo/.stack-work/install/x86_64-linux-tinfo6/5bd90cba0a527348c2a5e76b2cf00274dbd1f7721e239d81fe72b373a73011b7/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "estudo_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "estudo_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "estudo_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "estudo_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "estudo_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "estudo_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

project(
  'SciPy',
  'c', 'cpp', 'cython',
  # https://stackoverflow.com/questions/59201214/can-the-meson-project-version-be-assigned-dynamically
  version: '1.8.0.dev0+Unknown', # FIXME: git hash (see URL above).
  license: 'BSD-3',
  meson_version: '>= 0.60.0',
  default_options: [
    'buildtype=debugoptimized',
    'c_std=c99',
    'cpp_std=c++14',  # TODO: use c++11 if 14 is not available
    # TODO: the below -Wno flags are all needed to silence warnings in
    # f2py-generated code. This should be fixed in f2py itself.
    'c_args=-Wno-unused-function -Wno-conversion -Wno-unused-but-set-variable -Wno-misleading-indentation -Wno-incompatible-pointer-types',
  ],
)

# https://mesonbuild.com/Python-module.html
py_mod = import('python')
py3 = py_mod.find_installation()
py3_dep = py3.dependency()

subdir('spstats')
